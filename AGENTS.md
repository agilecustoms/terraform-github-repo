# AGENTS.md

The repo is public. `README.md` is shown on GitHub and Terraform Registry,
so it has only user-facing content, internals are here

## Tech summary

- Language: Terraform
- Artifact: Terraform Registry module `agilecustoms/repo/github`, version = git tag `v{version}`,
  w/o floating tags (`floating-tags: false`), released by CI with *release* on push to `main`

## Context

*infrastructure-core* creates all agilecustoms repos with it (`github/repo-*.tf`).
Repos it creates are ready for releases with GH Action *release*: `release` environment with secrets, protected branches

## Changes

The module is public, others depend on it: all changes (even small ones and docs) go through branch `next`,
see release procedure in [docs/contribution.md](docs/contribution.md) (breaking change: major version, migration guide)

## Development

`make lint test-tf-validate test-tf`, all targets are in [Makefile](Makefile).
`test-tf` runs `terraform test` (`tests/repo.tftest.hcl`) with a mocked `github` provider

## Documentation rules

- README Inputs table must match `variables.tf` (names, required, defaults), Outputs table must match `outputs.tf`
