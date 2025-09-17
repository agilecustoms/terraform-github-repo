variable "actions_repository_access_level" {
  type        = string
  default     = null
  description = "use organization for corporate gh actions"
  validation {
    condition     = var.actions_repository_access_level == null || contains(["none", "user", "organization", "enterprise"], var.actions_repository_access_level)
    error_message = "Visibility must be one of: node, user, organization or enterprise"
  }
}

variable "allow_auto_merge" {
  type    = bool
  default = true
}

variable "allow_update_branch" {
  type    = bool
  default = true
}

variable "archive_on_destroy" {
  type    = bool
  default = true
}

variable "auto_init" {
  type    = bool
  default = true
}

variable "bypass_actors" {
  type        = map(string)
  description = "actor_id => actor_type"
  default = {
    "0" = "OrganizationAdmin" # Documentation says it is 1, but if set to 1, it always detects changes
  }
}

variable "delete_branch_on_merge" {
  type    = bool
  default = true
}

variable "default_branch" {
  default = "main"
}

variable "description" {}

variable "has_discussions" {
  type    = bool
  default = null # true if visibility=public, false otherwise
}

variable "has_issues" {
  type    = bool
  default = null # true if visibility=public, false otherwise
}

variable "name" {}

variable "release_branches" {
  type        = list(string)
  default     = ["main", "next"]
  description = "these branches are _not_ created, instead you mark them as protected once they get created"
}

variable "release_environment" {
  type        = bool
  default     = true
  description = "create 'release' environment to store GH_TOKEN secret to allow pushing automated commits via release action. use false for -gitops repos that do not produce any artifact"
}

variable "release_environment_secrets" {
  type        = map(string)
  description = "secrets key => value"
  default     = {}
}

variable "require_code_owner_review" {
  type        = bool
  default     = true
  description = "Require code owner review for pull requests"
}

variable "required_approving_review_count" {
  type        = number
  default     = 1
  description = "Number of required approving reviews for pull requests"
}

variable "required_review_thread_resolution" {
  type        = bool
  default     = true
  description = "Require all review threads to be resolved before merging"
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
