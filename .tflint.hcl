# https://github.com/terraform-linters/tflint, run: make terraform-lint
# Public module: all rules, callers see types and descriptions in the Terraform Registry
plugin "terraform" {
  enabled = true
  preset  = "all"
}
