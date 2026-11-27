# Migration Guide

## v1 -> v2

Vulnerability alerts are now managed by the separate resource `github_repository_vulnerability_alerts`:
GitHub provider 6.12.0 deprecated the `vulnerability_alerts` argument of `github_repository`.
Input `vulnerability_alerts` is unchanged

- GitHub provider `>= 6.12.0` is required: update the provider constraint if you pin an older one,
  then run `terraform init -upgrade`
- if you set `vulnerability_alerts`, the plan shows `github_repository_vulnerability_alerts.repo` to be created:
  it sets the same value the repo already has. `github_repository.repo` has no changes
