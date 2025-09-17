variable "actions_repository_access_level" {
  type        = string
  default     = null
  description = "allows to set the access level of a non-public repositories actions and reusable workflows for use in other repositories"
  validation {
    condition     = var.actions_repository_access_level == null || contains(["none", "user", "organization", "enterprise"], var.actions_repository_access_level)
    error_message = "Visibility must be one of: node, user, organization or enterprise"
  }
}

variable "allow_auto_merge" {
  type        = bool
  default     = true
  description = "allow auto-merging pull requests on the repository"
}

variable "allow_update_branch" {
  type    = bool
  default = true
}

variable "archive_on_destroy" {
  type        = bool
  default     = true
  description = "archive the repository instead of deleting on destroy"
}

variable "auto_init" {
  type        = bool
  default     = true
  description = "produce an initial commit in the repository"
}

variable "bypass_actors" {
  type        = map(string)
  description = "actor_id => actor (role, team or app). Actors allowed to bypass branch/tag protection rules to make automated commit with version bump in release workflows"
  default = {
    "0" = "OrganizationAdmin" # Documentation says it is 1, but if set to 1, it always detects changes
  }
}

variable "delete_branch_on_merge" {
  type        = bool
  default     = true
  description = "automatically delete head branch after a pull request is merged"
}

variable "default_branch" {
  default     = "main"
  description = "This branch will be created and marked as default for the repo"
}

variable "description" {
  description = "A description of the repository"
}

variable "has_discussions" {
  type    = bool
  default = null # true if visibility=public, false otherwise
}

variable "has_issues" {
  type    = bool
  default = null # true if visibility=public, false otherwise
}

variable "name" {
  description = "Repository name"
}

variable "release_branches" {
  type        = list(string)
  default     = ["main", "next"]
  description = "protected branches that take changes only via PRs. Get 'release' environment associated — to access GitHub PAT to make automated commit/tag during release workflow"
}

variable "release_environment" {
  type        = bool
  default     = true
  description = "create 'release' environment - primarily to store GH_TOKEN PAT that can bypass branch/tag protection rules to make automated commit/tag during release workflow"
}

variable "release_environment_secrets" {
  type        = map(string)
  description = "secrets key => value. secrets to be placed in 'release' environment. Example: { GH_TOKEN = var.github_token }"
}

variable "require_code_owner_review" {
  type        = bool
  default     = true
  description = "Require an approving review in pull requests that modify files that have a designated code owner"
}

variable "require_last_push_approval" {
  type        = bool
  default     = true
  description = "Whether the most recent reviewable push must be approved by someone other than the person who pushed it"
}

variable "required_approving_review_count" {
  type        = number
  default     = 1
  description = "The number of approving reviews that are required before a pull request can be merged"
}

variable "required_review_thread_resolution" {
  type        = bool
  default     = true
  description = "All conversations on code must be resolved before a pull request can be merged"
}

variable "reviewers_github" {
  type        = list(string)
  description = <<EOT
List of GitHub usernames (or teams) to add as CODEOWNERS for .github/ files.
Notes:
1. Changes in CODEOWNERS file are not managed after initial creation
2. It is recommended to use a team name, not specific users (team needs to be visible, no secret)
3. team/users need to have write access to the repository
EOT
}

variable "visibility" {
  type    = string
  default = "private"
  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Visibility must be one of: public, private, internal"
  }
}
