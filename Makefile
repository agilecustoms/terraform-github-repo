terraform-init:
	@terraform init -upgrade

terraform-validate:
	@terraform validate

# needs tflint (brew install tflint), config in .tflint.hcl. --init installs ruleset plugins (once, then no-op)
terraform-lint:
	@tflint --init && tflint --format compact

terraform-test:
	@terraform test

terraform-format:
	@terraform fmt -recursive
