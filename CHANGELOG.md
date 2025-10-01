# Changelog

## [1.0.3](https://github.com/agilecustoms/terraform-github-repo/compare/v1.0.2...v1.0.3) (2025-10-01)

### Documentation

* replace image path with absolute URL to properly display in Terraform registry ([0e77c96](https://github.com/agilecustoms/terraform-github-repo/commit/0e77c969a7dba2d983ae70fcf4dc4400192fb9ba))


## [1.0.2](https://github.com/agilecustoms/terraform-github-repo/compare/v1.0.1...v1.0.2) (2025-09-30)

### Documentation

* cover scenario when import existing repo with default branch name other than 'main' ([4592354](https://github.com/agilecustoms/terraform-github-repo/commit/459235413c35c6a9b92f829c128737aa2e0dcbee))


## [1.0.1](https://github.com/agilecustoms/terraform-github-repo/compare/v1.0.0...v1.0.1) (2025-09-30)

### Documentation

* fix usage example ([fe942ec](https://github.com/agilecustoms/terraform-github-repo/commit/fe942ecc9e31b5da3135485689127bc32046d72d))


## [1.0.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.14.0...v1.0.0) (2025-09-30)

### ⚠ BREAKING CHANGES

* release

### Features

* release ([3b3cdbe](https://github.com/agilecustoms/terraform-github-repo/commit/3b3cdbe966a2528e0921803087fa76997113c387))

### Documentation

* add tags in header ([a111a5f](https://github.com/agilecustoms/terraform-github-repo/commit/a111a5f87f348ac2f143e3bdc3896645917d6e60))


## [0.14.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.13.5...v0.14.0) (2025-09-29)

### Features

* change release_branches default to be just 'main', remove 'next' ([059eef7](https://github.com/agilecustoms/terraform-github-repo/commit/059eef7a9bd53b8de09183da8f7317772ed2977a))


## [0.13.5](https://github.com/agilecustoms/terraform-github-repo/compare/v0.13.4...v0.13.5) (2025-09-29)

### Documentation

* usage example improved ([7f700f8](https://github.com/agilecustoms/terraform-github-repo/commit/7f700f850e19bf05a060919029c4ad1ceedbf728))


## [0.13.4](https://github.com/agilecustoms/terraform-github-repo/compare/v0.13.3...v0.13.4) (2025-09-28)

### Documentation

* add comment in vulnerability_alerts ([9693bcc](https://github.com/agilecustoms/terraform-github-repo/commit/9693bcc2a3d9050a141b03442d3688a42a1f2d54))


## [0.13.3](https://github.com/agilecustoms/terraform-github-repo/compare/v0.13.2...v0.13.3) (2025-09-28)

### Bug Fixes

* remove auto_init var, false value is always wrong, only true should be ([9601ddb](https://github.com/agilecustoms/terraform-github-repo/commit/9601ddbac30ea82032bc7a99a5e32430a18d737e))


## [0.13.2](https://github.com/agilecustoms/terraform-github-repo/compare/v0.13.1...v0.13.2) (2025-09-28)

### Miscellaneous

* codeowners commit should not trigger build ([f40ce6e](https://github.com/agilecustoms/terraform-github-repo/commit/f40ce6e9fb4a8607e8273add86c1509d6464560c))


## [0.13.1](https://github.com/agilecustoms/terraform-github-repo/compare/v0.13.0...v0.13.1) (2025-09-28)

### Bug Fixes

* reviewers_github in case if CODEOWNERS already exist ([5e33e68](https://github.com/agilecustoms/terraform-github-repo/commit/5e33e685c6a7d3b3d9e43eda5b0e5392d776edf9))


## [0.13.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.12.4...v0.13.0) (2025-09-27)

### Features

* change allow_update_branch default value ([226ac43](https://github.com/agilecustoms/terraform-github-repo/commit/226ac4317aa5109e629d90e4fe8ff58402f8f271))


## [0.12.4](https://github.com/agilecustoms/terraform-github-repo/compare/v0.12.3...v0.12.4) (2025-09-27)

### Documentation

* highlights and usage ([f2aefa3](https://github.com/agilecustoms/terraform-github-repo/commit/f2aefa31dfd0b5afe3100d383d28de39e745d995))


## [0.12.3](https://github.com/agilecustoms/terraform-github-repo/compare/v0.12.2...v0.12.3) (2025-09-27)

### Miscellaneous

* unify build workflow ([04a7f56](https://github.com/agilecustoms/terraform-github-repo/commit/04a7f56b294e60f79cc2ac155741a135676f8dba))


## [0.12.2](https://github.com/agilecustoms/terraform-github-repo/compare/v0.12.1...v0.12.2) (2025-09-27)

### Bug Fixes

* deployment_branch_policy property combination ([3f4d7ee](https://github.com/agilecustoms/terraform-github-repo/commit/3f4d7ee54f99fa99416a14b7d5a98c7fb620cffa))


## [0.12.1](https://github.com/agilecustoms/terraform-github-repo/compare/v0.12.0...v0.12.1) (2025-09-25)

### Miscellaneous

* tighten github_repository_environment ([4e8373b](https://github.com/agilecustoms/terraform-github-repo/commit/4e8373b3241407849a3751ad08d6e2f0c8fa43cc))


## [0.12.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.11.0...v0.12.0) (2025-09-24)

### Features

* add merge_queue support ([6fe15c1](https://github.com/agilecustoms/terraform-github-repo/commit/6fe15c1b8e6ec7b3b2bce31ae2ff89440cea811f))


## [0.11.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.10.0...v0.11.0) (2025-09-24)

### Features

* add required_code_scanning block ([1207b05](https://github.com/agilecustoms/terraform-github-repo/commit/1207b05e7dd065626f43dc18a77c4bc76da340b0))


## [0.10.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.9.0...v0.10.0) (2025-09-24)

### Features

* expose some more default vars ([d6baf15](https://github.com/agilecustoms/terraform-github-repo/commit/d6baf1569e590b1bb70db2c0288e5e70160f7894))


## [0.9.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.8.0...v0.9.0) (2025-09-24)

### Features

* simplify has_discussions and has_issues contract ([e5474a8](https://github.com/agilecustoms/terraform-github-repo/commit/e5474a884af110a5eaaaff5957f1203484f77eab))


## [0.8.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.7.0...v0.8.0) (2025-09-24)

### Features

* finalize github_repository params ([537673e](https://github.com/agilecustoms/terraform-github-repo/commit/537673e4b378d19947d337adb52d0c1dc8164573))


## [0.7.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.6.2...v0.7.0) (2025-09-24)

### Features

* intermediate commit with lots of new vars ([4a4735b](https://github.com/agilecustoms/terraform-github-repo/commit/4a4735b6de8bbcd2414f3c0fe42089d4865b2f8a))


## [0.6.2](https://github.com/agilecustoms/terraform-github-repo/compare/v0.6.1...v0.6.2) (2025-09-20)

### Miscellaneous

* update actions/checkout to v5 ([d498ccc](https://github.com/agilecustoms/terraform-github-repo/commit/d498cccf4708f2a6da8621dec63243bb6017afde))


## [0.6.1](https://github.com/agilecustoms/terraform-github-repo/compare/v0.6.0...v0.6.1) (2025-09-17)

### Documentation

* document defaults ([31e4b86](https://github.com/agilecustoms/terraform-github-repo/commit/31e4b86f7b7b17c8c841b1268f6dda4841ad6501))


## [0.6.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.5.0...v0.6.0) (2025-09-17)

### Features

* add require_last_push_approval ([8e9e559](https://github.com/agilecustoms/terraform-github-repo/commit/8e9e5599f96e096e9bd3e4cc2132c087b4be0270))


## [0.5.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.4.1...v0.5.0) (2025-09-17)

### Features

* rename variables, start documentation ([55f2ff4](https://github.com/agilecustoms/terraform-github-repo/commit/55f2ff458fb10e7560342e1c59f7cb7ad92dd30f))


## [0.4.1](https://github.com/agilecustoms/terraform-github-repo/compare/v0.4.0...v0.4.1) (2025-09-16)

### Bug Fixes

* update var description ([997fc97](https://github.com/agilecustoms/terraform-github-repo/commit/997fc97e8b59ec4ba6d7f289a75c1e200d41e669))


## [0.4.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.3.0...v0.4.0) (2025-09-15)

### Features

* add CODEOWNERS ([bc35a05](https://github.com/agilecustoms/terraform-github-repo/commit/bc35a055f2ca2677f700b6a5c0c2c545230fce60))


## [0.3.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.2.0...v0.3.0) (2025-09-07)

### Features

* configure PR review ([2e0e658](https://github.com/agilecustoms/terraform-github-repo/commit/2e0e65863fb2ea16d30f0037853cc7e1eaacd4cc))


## [0.2.0](https://github.com/agilecustoms/terraform-github-repo/compare/v0.1.0...v0.2.0) (2025-09-07)

### Features

* basic functionality - protected branches, tags and release environment ([a6a4208](https://github.com/agilecustoms/terraform-github-repo/commit/a6a420824170dceeab2fb02b483835dacf3d6748))