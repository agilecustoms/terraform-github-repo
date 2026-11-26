# AGENTS.md

Shared agilecustoms rules (git, code style) are in `../tools/agents/AGENTS.md`.
This file is `terraform-github-repo` specific

`README.md` is its public page (GitHub, Terraform Registry): only user-facing content goes there, internals are here

## Tech summary

- Language: Terraform
- Artifact: Terraform Registry module `agilecustoms/repo/github`, version = git tag `v{version}`,
  w/o floating tags (`floating-tags: false`), released by CI with *release* on push to `main`

## Context

*infrastructure-core* creates all agilecustoms repos with it (`github/repo-*.tf`).
Repos it creates are ready for releases with GH Action *release*: `release` environment with secrets, protected branches

## Development

`make lint test-tf-validate test-tf`, all targets are in [Makefile](Makefile).
`test-tf` runs `terraform test` (`tests/repo.tftest.hcl`) with a mocked `github` provider

## Documentation rules

- the repo is public: in docs and examples use placeholders (`my-company`, `123456789012`), not real ids
- README Inputs table must match `variables.tf` (names, required, defaults), Outputs table must match `outputs.tf`
