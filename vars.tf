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

variable "allow_merge_commit" {
  type        = bool
  default     = true
  description = "Set to false to disable merge commits on the repository"
}

variable "allow_rebase_merge" {
  type        = bool
  default     = true
  description = "Set to false to disable rebase merges on the repository"
}

variable "allow_squash_merge" {
  type        = bool
  default     = true
  description = "Set to false to disable squash merges on the repository."
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

variable "archived" {
  type        = bool
  default     = false
  description = "Specifies if the repository should be archived. Defaults to false. NOTE Currently, the API does not support unarchiving"
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
  type        = string
  default     = "main"
  description = "This branch will be created and marked as default for the repo"
}

variable "description" {
  type        = string
  description = "A description of the repository"
}

variable "gitignore_template" {
  type        = string
  default     = null
  description = "Use the name of the template without the extension. For example, Haskell"
}

variable "has_discussions" {
  type    = bool
  default = null # true if visibility=public, false otherwise
}

variable "has_issues" {
  type    = bool
  default = null # true if visibility=public, false otherwise
}

variable "has_projects" {
  type    = string
  default = null
}

variable "has_wiki" {
  type        = bool
  default     = false
  description = "Set to true to enable the GitHub Wiki features on the repository"
}

variable "homepage_url" {
  type        = string
  default     = null
  description = "URL of a page describing the project"
}

variable "is_template" {
  type        = bool
  default     = false
  description = "Set to true to tell GitHub that this is a template repository"
}

variable "license_template" {
  type        = string
  default = null
  description = "Use the name of the template without the extension. For example, mit or mpl-2.0"
}

variable "merge_commit_message" {
  type        = string
  default     = null
  description = "Can be PR_BODY, PR_TITLE, or BLANK for a default merge commit message. Applicable only if allow_merge_commit is true"
}

variable "merge_commit_title" {
  type        = string
  default     = null
  description = "Can be PR_TITLE or MERGE_MESSAGE for a default merge commit title. Applicable only if allow_merge_commit is true"
}

variable "name" {
  type        = string
  default     = null
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

variable "squash_merge_commit_message" {
  type        = string
  default     = null
  description = "Can be PR_BODY, COMMIT_MESSAGES, or BLANK for a default squash merge commit message. Applicable only if allow_squash_merge is true"
}

variable "squash_merge_commit_title" {
  type        = string
  default     = null
  description = "Can be PR_TITLE or COMMIT_OR_PR_TITLE for a default squash merge commit title. Applicable only if allow_squash_merge is true"
}

variable "template_owner" {
    type        = string
    default     = null
    description = "The GitHub organization or user the template repository is owned by"
}

variable "template_repository" {
  type = string
  default = null
  description = "The name of the template repository"
}

variable "template_include_all_branches" {
  type = string
  default = false
  description = "Whether the new repository should include all the branches from the template repository (defaults to false, which includes only the default branch from the template)"
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "The list of topics of the repository"
}

variable "visibility" {
  type    = string
  default = "private"
  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Visibility must be one of: public, private, internal"
  }
}

variable "web_commit_signoff_required" {
  type        = bool
  default     = false
  description = "Require contributors to sign off on web-based commits"
}
