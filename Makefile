terraform-init:
	@terraform init -upgrade

terraform-validate:
	@terraform validate

terraform-test:
	@terraform test

terraform-format:
	@terraform fmt -recursive
