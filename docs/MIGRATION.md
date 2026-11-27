# Migration Guide

## v1 -> v2

GitHub provider 6.12.0 deprecated parts of `github_repository` in favor of separate resources, the module uses them.
Inputs are unchanged, except one removed

- GitHub provider `>= 6.12.0` is required: update the provider constraint if you pin an older one,
  then run `terraform init -upgrade`
- vulnerability alerts are managed by `github_repository_vulnerability_alerts`.
  If you set `vulnerability_alerts`, the plan shows `github_repository_vulnerability_alerts.repo` to be created:
  it sets the same value the repo already has
- GitHub Pages are managed by `github_repository_pages`.
  If you set `pages_build_type` or `pages_source_branch`, import the existing Pages site before apply
  (creating it fails, the site already exists). In the root module:

  ```hcl
  import {
    to = module.my_repo.github_repository_pages.repo[0]
    id = "my-repo" # repository name
  }
  ```

  `github_repository.repo` ignores changes of its deprecated `pages` block, so the site is not disabled.
  `pages_source_branch` w/o `pages_build_type` sets build type `legacy` explicitly
  (GitHub default, the new resource needs it to publish from a branch)
- input `ignore_vulnerability_alerts_during_read` is removed: it is deprecated and ignored by GitHub provider
  (handles lack of permissions automatically), remove it from the module call
