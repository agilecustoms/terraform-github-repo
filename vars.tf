variable "default_branch" {
  default = "main"
}

variable "description" {}

variable "gh_action" {
  type        = bool
  description = "This repo is a custom GitHub action and thus needs to be accessible to the organization"
  default     = false
}

variable "has_discussions" {
  type    = bool
  default = null # default behavior depends on public visibility
}

variable "has_issues" {
  type    = bool
  default = null # default behavior depends on public visibility
}

variable "name" {}

variable "release_branches" {
  type        = list(string)
  default     = ["main", "next"]
  description = "these branches are _not_ created, instead you mark them as protected once they get created"
}

variable "public" {
  type    = bool
  default = false
}

variable "release_environment" {
  type        = bool
  default     = true
  description = "create 'release' environment to store GH_TOKEN secret to allow pushing automated commits via release action. use false for -gitops repos that do not produce any artifact"
}

variable "secrets" {
  type        = map(string)
  description = "secrets key => value"
  default     = {}
}
