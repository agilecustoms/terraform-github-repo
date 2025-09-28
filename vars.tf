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
  type        = bool
  default     = null
  description = "Set to true to always suggest updating pull request branches"
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
  type = map(string)
  default = {
    "0" = "OrganizationAdmin" # Documentation says it is 1, but if set to 1, it always detects changes
  }
  description = "actor_id => actor (role, team or app). Actors allowed to bypass branch/tag protection rules to make automated commit with version bump in release workflows"
}

variable "commit_author" {
  type        = string
  default     = null
  description = "Committer author name to use. NOTE: GitHub app users may omit author and email information so GitHub can verify commits as the GitHub App. This maybe useful when a branch protection rule requires signed commits"
}

variable "commit_email" {
  type        = string
  default     = null
  description = "Committer email address to use. NOTE: GitHub app users may omit author and email information so GitHub can verify commits as the GitHub App. This may be useful when a branch protection rule requires signed commits"
}

variable "codeowners_commit_message" {
  type        = string
  default     = "Admins must approve any changes in .github dir"
  description = ""
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
  type        = bool
  default     = null
  description = "Set to true to enable the GitHub Discussions on the repository"
}

variable "has_issues" {
  type        = bool
  default     = null
  description = "Set to true to enable the GitHub Issues features on the repository"
}

variable "has_projects" {
  type        = string
  default     = null
  description = "Set to true to enable the GitHub Projects features on the repository"
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

variable "ignore_vulnerability_alerts_during_read" {
  type        = bool
  default     = null
  description = "Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read"
}

variable "is_template" {
  type        = bool
  default     = false
  description = "Set to true to tell GitHub that this is a template repository"
}

variable "license_template" {
  type        = string
  default     = null
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

variable "merge_queue" {
  type        = bool
  default     = false
  description = "Allow to enable merge queue, see inputs with merge_queue_ prefix"
}

variable "merge_queue_check_response_timeout_minutes" {
  type        = number
  default     = 60
  description = "Maximum time for a required status check to report a conclusion. After this much time has elapsed, checks that have not reported a conclusion will be assumed to have failed"
}

variable "merge_queue_grouping_strategy" {
  type        = string
  default     = "ALLGREEN"
  description = "When set to ALLGREEN, the merge commit created by merge queue for each PR in the group must pass all required checks to merge. When set to HEADGREEN, only the commit at the head of the merge group must pass its required checks to merge. Can be one of: ALLGREEN, HEADGREEN"
}

variable "merge_queue_max_entries_to_build" {
  type        = number
  default     = 5
  description = "Limit the number of queued pull requests requesting checks and workflow runs at the same time"
}

variable "merge_queue_max_entries_to_merge" {
  type        = number
  default     = 5
  description = "Limit the number of queued pull requests requesting checks and workflow runs at the same time"
}

variable "merge_queue_merge_method" {
  type        = string
  default     = "MERGE"
  description = "Method to use when merging changes from queued pull requests. Can be one of: MERGE, SQUASH, REBASE"
}

variable "merge_queue_min_entries_to_merge" {
  type        = number
  default     = 1
  description = "The minimum number of PRs that will be merged together in a group"
}

variable "merge_queue_min_entries_to_merge_wait_minutes" {
  type        = number
  default     = 5
  description = "The time merge queue should wait after the first PR is added to the queue for the minimum group size to be met. After this time has elapsed, the minimum group size will be ignored and a smaller group will be merged"
}

variable "name" {
  type        = string
  description = "Repository name"
}

variable "pages_build_type" {
  type        = string
  default     = null
  description = "The type of GitHub Pages site to build. Can be legacy or workflow. If you use legacy as build type you need to set the option source"
}

variable "pages_cname" {
  type        = string
  default     = null
  description = "The custom domain for the repository. This can only be set after the repository has been created"
}

variable "pages_source_branch" {
  type        = string
  default     = null
  description = "The repository branch used to publish the site's source files. (i.e. main or gh-pages"
}

variable "pages_source_path" {
  type        = string
  default     = "/"
  description = "The repository directory from which the site publishes"
}

variable "release_branch_pattern" {
  type        = string
  default     = null
  description = "Alternative to release_branches. Only works for Enterprise. If specified, the release_branches ignored. Must also specify release_branch_operator"
}

variable "release_branch_operator" {
  type        = string
  default     = null
  description = "The operator to use for matching. Can be one of: starts_with, ends_with, contains, regex"
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

variable "required_code_scanning_alerts_threshold" {
  type        = string
  default     = null
  description = "The severity level at which code scanning results that raise alerts block a reference update. Can be one of: none, errors, errors_and_warnings, all"
}

variable "required_code_scanning_security_alerts_threshold" {
  type        = string
  default     = null
  description = "The severity level at which code scanning results that raise security alerts block a reference update. Can be one of: none, critical, high_or_higher, medium_or_higher, all"
}

variable "required_code_scanning_tool" {
  type        = string
  default     = null
  description = "The name of a code scanning tool"
}

variable "required_linear_history" {
  type        = bool
  default     = null
  description = "Prevent merge commits from being pushed to matching branches"
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

variable "required_signatures" {
  type        = bool
  default     = null
  description = "Commits pushed to matching branches must have verified signatures"
}

variable "reviewers_github" {
  type        = list(string)
  description = "List of GitHub usernames (or teams) to add as CODEOWNERS for .github/ files. Recommended to use a team, but can be individual users. Empty array to skip .github/ reviewers. Do not override CODEOWNERS if it already exist. Future changes in CODEOWNERS do not cause drift detection"
}

variable "ruleset_enforcement" {
  type        = string
  default     = "active"
  description = "Possible values for Enforcement are disabled, active, evaluate. Note: evaluate is currently only supported for owners of type organization"
}

variable "security_and_analysis_advanced_security_status" {
  type        = string
  default     = null
  description = "Set to enabled to enable advanced security features on the repository. Can be enabled or disabled"
}

variable "security_and_analysis_secret_scanning_push_protection_status" {
  type        = string
  default     = null
  description = "Set to enabled to enable secret scanning push protection on the repository. Can be enabled or disabled. If set to enabled, the repository's visibility must be public or security_and_analysis_advanced_security_status must also be set to enabled"
}

variable "security_and_analysis_secret_scanning_status" {
  type        = string
  default     = null
  description = "Set to enabled to enable secret scanning on the repository. Can be enabled or disabled. If set to enabled, the repository's visibility must be public or security_and_analysis_.advanced_security_status must also be set to enabled"
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
  type        = string
  default     = null
  description = "The name of the template repository"
}

variable "template_include_all_branches" {
  type        = string
  default     = false
  description = "Whether the new repository should include all the branches from the template repository (defaults to false, which includes only the default branch from the template)"
}

variable "topics" {
  type        = list(string)
  default     = null
  description = "The list of topics of the repository"
}

variable "visibility" {
  type        = string
  default     = "private"
  description = "Repository visibility: public, private or internal"
  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "Visibility must be one of: public, private, internal"
  }
}

variable "vulnerability_alerts" {
  type        = bool
  default     = null
  description = "Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. (Note for importing: GitHub enables the alerts on public repos but disables them on private repos by default.) See GitHub Documentation for details. Note that vulnerability alerts have not been successfully tested on any GitHub Enterprise instance and may be unavailable in those settings"
}

variable "web_commit_signoff_required" {
  type        = bool
  default     = false
  description = "Require contributors to sign off on web-based commits"
}
