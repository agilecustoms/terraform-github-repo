# Plan-only tests with mocked GitHub provider: no token needed, nothing is created

mock_provider "github" {}

variables {
  name                        = "test-repo"
  description                 = "test"
  reviewers_github            = ["alice", "bob"]
  release_environment_secrets = {}
}

run "defaults" {
  command = plan

  assert {
    condition     = github_repository.repo.name == "test-repo" && github_repository.repo.visibility == "private"
    error_message = "Repo must be private by default"
  }

  assert {
    condition     = length(github_repository.repo.template) == 0 && length(github_repository.repo.pages) == 0 && length(github_repository.repo.security_and_analysis) == 0
    error_message = "Optional repo blocks (template, pages, security_and_analysis) must be absent by default"
  }

  assert {
    condition     = length(github_actions_repository_access_level.access) == 0
    error_message = "Actions access level must not be managed by default"
  }

  assert {
    condition     = github_branch.default.branch == "main" && github_branch_default.it.branch == "main"
    error_message = "Default branch must be main"
  }

  assert {
    condition     = github_repository_file.codeowners[0].content == ".github/ @alice @bob\n"
    error_message = "CODEOWNERS must list all reviewers for .github dir"
  }

  assert {
    condition     = github_repository_ruleset.branches.conditions[0].ref_name[0].include == tolist(["refs/heads/main"])
    error_message = "Branches ruleset must target release branches"
  }

  assert {
    condition = (
      length(github_repository_ruleset.branches.rules[0].merge_queue) == 0
      && length(github_repository_ruleset.branches.rules[0].required_status_checks) == 0
      && length(github_repository_ruleset.branches.rules[0].branch_name_pattern) == 0
      && length(github_repository_ruleset.branches.rules[0].required_code_scanning) == 0
    )
    error_message = "Optional ruleset rules must be absent by default"
  }

  assert {
    condition = alltrue([for r in [github_repository_ruleset.branches, github_repository_ruleset.tags] :
      length(r.bypass_actors) == 1 && r.bypass_actors[0].actor_id == 0 && r.bypass_actors[0].actor_type == "OrganizationAdmin"
    ])
    error_message = "Both rulesets must let OrganizationAdmin bypass by default"
  }

  assert {
    condition     = github_repository_ruleset.tags.conditions[0].ref_name[0].include == tolist(["~ALL"])
    error_message = "Tags ruleset must protect all tags"
  }

  assert {
    condition     = length(github_repository_environment.release) == 1 && keys(github_repository_environment_deployment_policy.release) == ["main"]
    error_message = "Release environment must be created and limited to release branches"
  }
}

run "no_reviewers" {
  command = plan

  variables {
    reviewers_github = []
  }

  assert {
    condition     = length(github_repository_file.codeowners) == 0
    error_message = "CODEOWNERS must not be created without reviewers"
  }
}

run "actions_access_level_private" {
  command = plan

  variables {
    actions_repository_access_level = "organization"
  }

  assert {
    condition     = github_actions_repository_access_level.access[0].access_level == "organization"
    error_message = "Actions access level must be set for private repo"
  }
}

run "actions_access_level_public" {
  command = plan

  variables {
    visibility                      = "public"
    actions_repository_access_level = "organization"
  }

  assert {
    condition     = length(github_actions_repository_access_level.access) == 0
    error_message = "Actions access level must not be set for public repo"
  }
}

run "release_branch_pattern" {
  command = plan

  variables {
    release_branch_pattern  = "^(main|next)$"
    release_branch_operator = "regex"
  }

  assert {
    condition     = length(github_repository_ruleset.branches.conditions) == 0
    error_message = "ref_name conditions must be omitted when release_branch_pattern is set"
  }

  assert {
    condition     = github_repository_ruleset.branches.rules[0].branch_name_pattern[0].pattern == "^(main|next)$"
    error_message = "branch_name_pattern rule must use release_branch_pattern"
  }
}

run "merge_queue_and_status_checks" {
  command = plan

  variables {
    merge_queue            = true
    required_status_checks = { "Build" = 15368, "Lint" = 15368 }
  }

  assert {
    condition     = github_repository_ruleset.branches.rules[0].merge_queue[0].merge_method == "MERGE"
    error_message = "merge_queue rule must be present"
  }

  assert {
    condition     = length(github_repository_ruleset.branches.rules[0].required_status_checks[0].required_check) == 2
    error_message = "Each required status check must be added"
  }
}

run "release_environment" {
  command = plan

  variables {
    release_branches            = ["main", "next"]
    release_environment_secrets = { "GH_TOKEN" = "x", "NPM_TOKEN" = "y" }
  }

  assert {
    condition     = toset(keys(github_repository_environment_deployment_policy.release)) == toset(["main", "next"])
    error_message = "Deployment policy must be created per release branch"
  }

  assert {
    condition     = toset(keys(github_actions_environment_secret.release)) == toset(["GH_TOKEN", "NPM_TOKEN"])
    error_message = "Secret must be created per release_environment_secrets entry"
  }

  assert {
    condition     = github_repository_ruleset.branches.conditions[0].ref_name[0].include == tolist(["refs/heads/main", "refs/heads/next"])
    error_message = "Branches ruleset must target all release branches"
  }
}

run "no_release_environment" {
  command = plan

  variables {
    release_environment         = false
    release_environment_secrets = null
  }

  assert {
    condition = (
      length(github_repository_environment.release) == 0
      && length(github_repository_environment_deployment_policy.release) == 0
      && length(github_actions_environment_secret.release) == 0
    )
    error_message = "No release environment resources expected"
  }
}

run "optional_repo_blocks" {
  command = plan

  variables {
    template_owner                               = "acme"
    template_repository                          = "template"
    pages_build_type                             = "workflow"
    security_and_analysis_secret_scanning_status = "enabled"
  }

  assert {
    condition     = github_repository.repo.template[0].repository == "template"
    error_message = "template block expected"
  }

  assert {
    condition     = github_repository.repo.pages[0].build_type == "workflow" && length(github_repository.repo.pages[0].source) == 0
    error_message = "pages block without source expected for workflow build type"
  }

  assert {
    condition = (
      github_repository.repo.security_and_analysis[0].secret_scanning[0].status == "enabled"
      && length(github_repository.repo.security_and_analysis[0].advanced_security) == 0
    )
    error_message = "Only configured security_and_analysis sub-blocks expected"
  }
}

run "invalid_visibility" {
  command = plan

  variables {
    visibility = "secret"
  }

  expect_failures = [var.visibility]
}

run "invalid_actions_access_level" {
  command = plan

  variables {
    actions_repository_access_level = "everyone"
  }

  expect_failures = [var.actions_repository_access_level]
}

run "release_environment_requires_secrets" {
  command = plan

  variables {
    release_environment_secrets = null
  }

  expect_failures = [var.release_environment_secrets]
}

run "pages_legacy" {
  command = plan

  variables {
    pages_build_type    = "legacy"
    pages_source_branch = "gh-pages"
  }

  assert {
    condition     = github_repository.repo.pages[0].source[0].branch == "gh-pages" && github_repository.repo.pages[0].source[0].path == "/"
    error_message = "pages.source expected when pages_source_branch is set"
  }
}
