resource "github_repository" "repo" {
  allow_auto_merge       = true
  allow_update_branch    = true
  archive_on_destroy     = true # it doesn't respect lifecycle.prevent_destroy property :(
  auto_init              = true # required to create a branch
  delete_branch_on_merge = true
  description            = var.description
  has_discussions        = var.has_discussions != null ? var.has_discussions : var.public
  has_issues             = var.has_issues != null ? var.has_issues : var.public
  name                   = var.name
  visibility             = var.public ? "public" : "private" # no internal for now
}

# resource "github_actions_repository_access_level" "access" {
#   count        = !var.public && var.gh_action ? 1 : 0
#   repository   = github_repository.repo.name
#   access_level = "organization"
# }
#
# # documentation doesn't speak about it, but this resource behaves "create if not exist. if exist - import in tf state"
# resource "github_branch" "default" {
#   repository = github_repository.repo.name
#   branch     = var.default_branch
# }
#
# resource "github_branch_default" "it" {
#   repository = github_repository.repo.name
#   branch     = github_branch.default.branch
# }
#
# resource "github_repository_ruleset" "branches" {
#   name        = "Branches"
#   repository  = github_repository.repo.name
#   target      = "branch"
#   enforcement = "active"
#
#   bypass_actors {
#     actor_id    = 0 # OrganizationAdmin. Documentation says it is 1, but if set to 1, it always detects changes
#     actor_type  = "OrganizationAdmin"
#     bypass_mode = "always"
#   }
#
#   conditions {
#     ref_name {
#       include = formatlist("refs/heads/%s", var.release_branches) # convert ["main", "next"] to ["refs/heads/main", "refs/heads/next"].
#       exclude = []
#     }
#   }
#
#   rules {
#     creation         = true
#     deletion         = true
#     non_fast_forward = true # no force push
#
#     pull_request {
#       require_code_owner_review         = true
#       required_approving_review_count   = 1
#       required_review_thread_resolution = true
#     }
#   }
# }
#
# resource "github_repository_ruleset" "tags" {
#   name        = "Tags"
#   repository  = github_repository.repo.name
#   target      = "tag"
#   enforcement = "active"
#
#   bypass_actors {
#     actor_id    = 0 # OrganizationAdmin. Documentation says it is 1, but if set to 1, it always detects changes
#     actor_type  = "OrganizationAdmin"
#     bypass_mode = "always"
#   }
#
#   conditions {
#     ref_name {
#       include = ["~ALL"]
#       exclude = []
#     }
#   }
#
#   rules {
#     creation         = true
#     update           = true
#     deletion         = true
#     non_fast_forward = true # no force push
#   }
# }
