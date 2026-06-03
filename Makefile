pytest:

test: pytest

init: ## init your terraform environment
	@echo Environment is: $(env)
	@rm -rf .terraform
	@terraform init -backend=true --backend-config=./backend_config/$(env).tfvars

validate: ## validate terraform syntax
	@terraform validate

fmt: ## format terraform code
	@terraform fmt -recursive -diff

plan: ## show plan for infrastructure changes
	@terraform plan -var-file=./env_vars/$(env).tfvars -out build.out

apply: ## apply generated build.out file
	@terraform apply "build.out"

destroy: ## destroy environment
	@terraform plan -destroy -var-file=./env_vars/$(env).tfvars -out build.out