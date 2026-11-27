# Contribution guideline

For any bugs, feel free to create an issue or raise a pull request with a fix

## Release procedure

The module is public: a change must not break the workflow of those who use it.
Every push to `main` is released to the Terraform Registry,
the version is derived from the commit prefix (conventional commits):
`fix:`, `misc:`, `docs:`, `build:` -> patch, `feat:` -> minor, `feat!:` or `BREAKING CHANGE:` footer -> major

All changes, even small ones and docs, are developed in branch `next` and tested in a real project
before they are released:

1. create branch `next` from `main` (if it doesn't exist), commit and push there:
   CI validates and tests it, but doesn't release
2. in your own project, point the module to the branch and run plan/apply there:
   `source = "git::https://github.com/agilecustoms/terraform-github-repo.git?ref=next"`
3. a breaking change: commit with `feat!:` and a `BREAKING CHANGE:` footer,
   add a section to [MIGRATION.md](MIGRATION.md): what changed and what users need to do
4. after testing: create a PR `next` -> `main` and merge it with a merge commit
   (squash would lose the individual commit prefixes the version and release notes are derived from).
   CI releases the new version
5. recreate `next` from `main` (GitHub deletes it on merge) and push it: your project keeps using `next`
