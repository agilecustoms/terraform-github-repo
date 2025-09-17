# Repo

In public repos after creation do these manual steps:
1. Security tab > enable "Private vulnerability reporting"
2. Code > Watch > Custom > make sure "Security alerts" is enabled OR "All activity" if you want to get all notifications


## Requirements

| Name      | Version   |
|-----------|-----------|
| terraform | >= 1.5.7  |
| github    | >= 4.26.0 |

## Providers

| Name   | Version   |
|--------|-----------|
| github | >= 4.26.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                  | Type     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)                                                                | resource |
| [github_actions_repository_access_level.access](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_repository_access_level)                    | resource |
| [github_branch.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch)                                                                     | resource |
| [github_branch_default.it](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default)                                                          | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file)                                                | resource |
| [github_repository_ruleset.branches](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset)                                            | resource |
| [github_repository_ruleset.tags](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset)                                                | resource |
| [github_repository_environment.release](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment)                                     | resource |
| [github_actions_environment_secret.release](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_secret)                             | resource |
| [github_repository_environment_deployment_policy.release](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment_deployment_policy) | resource |

## Inputs

| Name                              | Default                       | Description                                                                                                                                                                                                                                                  |
|-----------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| actions_repository_access_level   |                               | Allows to set the access level of a non-public repositories actions and reusable workflows for use in other repositories                                                                                                                                     |
| allow_auto_merge                  | _true_                        | Allow auto-merging pull requests on the repository                                                                                                                                                                                                           |
| allow_update_branch               | _true_                        |                                                                                                                                                                                                                                                              |
| archive_on_destroy                | _true_                        | Archive the repository instead of deleting on destroy                                                                                                                                                                                                        |
| auto_init                         | _true_                        | Produce an initial commit in the repository                                                                                                                                                                                                                  |
| **bypass_actors**                 | { "0" = "OrganizationAdmin" } | Actor_id => actor (role, team or app). Actors allowed to bypass branch/tag protection rules to make automated commit with version bump in release workflows                                                                                                  |
| delete_branch_on_merge            | _true_                        | Automatically delete head branch after a pull request is merged                                                                                                                                                                                              |
| default_branch                    | main                          | This branch will be created and marked as default for the repo                                                                                                                                                                                               |
| **description**                   |                               | A description of the repository                                                                                                                                                                                                                              |
| has_discussions                   | (see description)             | Dynamic default. _true_ if visibility=public, _false_ otherwise                                                                                                                                                                                              |
| has_issues                        | (see description)             | Dynamic default. _true_ if visibility=public, _false_ otherwise                                                                                                                                                                                              |
| **name**                          |                               | Repository name                                                                                                                                                                                                                                              |
| **release_branches**              | \[main, next]                 | Protected branches that take changes only via PRs. Get 'release' environment associated — to access GitHub PAT to make automated commit/tag during release workflow. Branches in this list not have to exist at the moment of this terraform module creation |
| **release_environment**           | _true_                        | Create 'release' environment - primarily to store GH_TOKEN PAT that can bypass branch/tag protection rules to make automated commit/tag during release workflow                                                                                              |
| **release_environment_secrets**   |                               | Secrets key => value. secrets to be placed in 'release' environment. Example: { GH_TOKEN = var.github_token }                                                                                                                                                |
| require_code_owner_review         | _true_                        | Require an approving review in pull requests that modify files that have a designated code owner                                                                                                                                                             |
| require_last_push_approval        | _true_                        | Whether the most recent reviewable push must be approved by someone other than the person who pushed it                                                                                                                                                      |
| required_approving_review_count   | 1                             | The number of approving reviews that are required before a pull request can be merged                                                                                                                                                                        |
| required_review_thread_resolution | _true_                        | All conversations on code must be resolved before a pull request can be merged                                                                                                                                                                               |
| **reviewers_github**              |                               | CODEOWNERS for files in `.github/`. Recommended to use a team, but can be individual users. Empty array to skip `.github` reviewers                                                                                                                          |
| visibility                        | private                       | Possible values: public, private and internal                                                                                                                                                                                                                |


## Outputs

| Name | Description      |
|------|------------------|
| id   | GitHub repo id   |
| name | GitHub repo name |

## Authors

Module is maintained by [Alexey Chekulaev](https://github.com/laxa1986)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/agilecustoms/terraform-github-repo/blob/main/LICENSE) for full details

## Copyright

Copyright 2025 [Alexey Chekulaev](https://github.com/laxa1986)
