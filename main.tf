resource "github_repository" "repo" {
  allow_auto_merge                        = var.allow_auto_merge
  allow_merge_commit                      = var.allow_merge_commit
  allow_rebase_merge                      = var.allow_rebase_merge
  allow_squash_merge                      = var.allow_squash_merge
  allow_update_branch                     = var.allow_update_branch
  archive_on_destroy                      = var.archive_on_destroy # it doesn't respect lifecycle.prevent_destroy property :(
  archived                                = var.archived
  auto_init                               = var.auto_init # required to create a branch
  delete_branch_on_merge                  = var.delete_branch_on_merge
  description                             = var.description
  gitignore_template                      = var.gitignore_template
  has_discussions                         = var.has_discussions
  has_issues                              = var.has_issues
  has_projects                            = var.has_projects
  has_wiki                                = var.has_wiki
  homepage_url                            = var.homepage_url
  ignore_vulnerability_alerts_during_read = var.ignore_vulnerability_alerts_during_read
  is_template                             = var.is_template
  license_template                        = var.license_template
  merge_commit_message                    = var.merge_commit_message
  merge_commit_title                      = var.merge_commit_title
  name                                    = var.name
  squash_merge_commit_message             = var.squash_merge_commit_message
  squash_merge_commit_title               = var.squash_merge_commit_title
  topics                                  = var.topics
  visibility                              = var.visibility
  vulnerability_alerts                    = var.vulnerability_alerts
  web_commit_signoff_required             = var.web_commit_signoff_required

  dynamic "template" {
    for_each = var.template_owner != null && var.template_repository != null ? [1] : []
    content {
      owner                = var.template_owner
      repository           = var.template_repository
      include_all_branches = var.template_include_all_branches
    }
  }

  dynamic "pages" {
    for_each = var.pages_source_branch != null || var.pages_build_type != null ? [1] : []
    content {
      cname      = var.pages_cname
      build_type = var.pages_build_type
      source {
        branch = var.pages_source_branch
        path   = var.pages_source_path
      }
    }
  }

  dynamic "security_and_analysis" {
    for_each = var.security_and_analysis_advanced_security_status != null || var.security_and_analysis_secret_scanning_status != null || var.security_and_analysis_secret_scanning_push_protection_status != null ? [1] : []
    content {
      dynamic "advanced_security" {
        for_each = var.security_and_analysis_advanced_security_status != null ? [1] : []
        content {
          status = var.security_and_analysis_advanced_security_status
        }
      }

      dynamic "secret_scanning" {
        for_each = var.security_and_analysis_secret_scanning_status != null ? [1] : []
        content {
          status = var.security_and_analysis_secret_scanning_status
        }
      }

      dynamic "secret_scanning_push_protection" {
        for_each = var.security_and_analysis_secret_scanning_push_protection_status != null ? [1] : []
        content {
          status = var.security_and_analysis_secret_scanning_push_protection_status
        }
      }
    }
  }
}

resource "github_actions_repository_access_level" "access" {
  count        = var.visibility != "public" && var.actions_repository_access_level != null ? 1 : 0
  repository   = github_repository.repo.name
  access_level = var.actions_repository_access_level
}

# documentation doesn't speak about it, but this resource behaves "create if not exist. if exist - import in tf state"
resource "github_branch" "default" {
  repository = github_repository.repo.name
  branch     = var.default_branch
}

resource "github_branch_default" "it" {
  repository = github_repository.repo.name
  branch     = github_branch.default.branch
}

resource "github_repository_file" "codeowners" {
  count               = length(var.reviewers_github) > 0 ? 1 : 0
  repository          = github_repository.repo.name
  branch              = github_branch.default.branch
  file                = ".github/CODEOWNERS"
  content             = ".github/ @${join(" @", var.reviewers_github)}\n"
  commit_message      = "Admins must approve any changes in .github dir"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [content] # any changes is EVOLUTION, so no need to overwrite existing file
  }
}

resource "github_repository_ruleset" "branches" {
  # First create CODEOWNERS file, then protect branches
  depends_on = [github_repository_file.codeowners]

  name        = "Branches"
  repository  = github_repository.repo.name
  target      = "branch"
  enforcement = "active"

  dynamic "bypass_actors" {
    for_each = var.bypass_actors
    content {
      actor_id    = tonumber(bypass_actors.key)
      actor_type  = bypass_actors.value
      bypass_mode = "always" # other option is "pull_request", but it doesn't work for automated commit (update CHANGELOG.md)
    }
  }

  conditions {
    ref_name {
      include = formatlist("refs/heads/%s", var.release_branches) # convert ["main", "next"] to ["refs/heads/main", "refs/heads/next"].
      exclude = []
    }
  }

  rules {
    creation         = true
    deletion         = true
    non_fast_forward = true # no force push

    pull_request {
      require_code_owner_review         = var.require_code_owner_review
      require_last_push_approval        = var.require_last_push_approval
      required_approving_review_count   = var.required_approving_review_count
      required_review_thread_resolution = var.required_review_thread_resolution
    }
  }
}

resource "github_repository_ruleset" "tags" {
  name        = "Tags"
  repository  = github_repository.repo.name
  target      = "tag"
  enforcement = "active"

  dynamic "bypass_actors" {
    for_each = var.bypass_actors
    content {
      actor_id    = tonumber(bypass_actors.key)
      actor_type  = bypass_actors.value
      bypass_mode = "always" # other option is "pull_request", but it doesn't work for automated commit (update CHANGELOG.md)
    }
  }

  conditions {
    ref_name {
      include = ["~ALL"]
      exclude = []
    }
  }

  rules {
    creation         = true
    update           = true
    deletion         = true
    non_fast_forward = true # no force push
  }
}
