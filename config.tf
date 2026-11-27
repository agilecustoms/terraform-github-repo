terraform {
  required_version = ">= 1.9.0" # validation of release_environment_secrets references another variable

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.12.0" # github_repository_vulnerability_alerts
    }
  }
}
