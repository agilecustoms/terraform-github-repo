resource "github_repository_environment" "release" {
  count       = var.release_environment ? 1 : 0
  repository  = github_repository.repo.name
  environment = "release"
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_actions_environment_secret" "release" {
  for_each        = var.release_environment ? var.release_environment_secrets : {}
  repository      = github_repository.repo.name
  environment     = github_repository_environment.release[0].environment
  secret_name     = each.key
  plaintext_value = each.value
}

resource "github_repository_environment_deployment_policy" "release" {
  for_each       = var.release_environment ? toset(var.release_branches) : []
  repository     = github_repository.repo.name
  environment    = github_repository_environment.release[0].environment
  branch_pattern = each.value # or "release/*" for pattern matching
}
