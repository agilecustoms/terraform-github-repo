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

| Name                              | Default                       | Description                                                                                                                         |
|-----------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| actions_repository_access_level   |                               | use organization for corporate gh actions                                                                                           |
| allow_auto_merge                  | _true_                        |                                                                                                                                     |
| allow_update_branch               | _true_                        |                                                                                                                                     |
| archive_on_destroy                | _true_                        |                                                                                                                                     |
| auto_init                         | _true_                        |                                                                                                                                     |
| bypass_actors                     | { "0" = "OrganizationAdmin" } | actor_id => actor_type                                                                                                              |
| delete_branch_on_merge            | _true_                        |                                                                                                                                     |
| default_branch                    | main                          |                                                                                                                                     |
| **description** (required)        |                               |                                                                                                                                     |
| has_discussions                   | (see description)             | dynamic default. _true_ if visibility=public, _false_ otherwise                                                                     |
| has_issues                        | (see description)             | dynamic default. _true_ if visibility=public, _false_ otherwise                                                                     |
| **name** (required)               |                               |                                                                                                                                     |
| release_branches                  | \[main, next]                 |                                                                                                                                     |
| release_environment               | _true_                        |                                                                                                                                     |
| release_environment_secrets       |                               |                                                                                                                                     |
| require_code_owner_review         | _true_                        |                                                                                                                                     |
| required_approving_review_count   | 1                             |                                                                                                                                     |
| required_review_thread_resolution | _true_                        |                                                                                                                                     |
| **reviewers_github** (required)   |                               | CODEOWNERS for files in `.github/`. Recommended to use a team, but can be individual users. Empty array to skip `.github` reviewers |
| visibility                        | private                       | Possible values: public, private and internal                                                                                       |


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
