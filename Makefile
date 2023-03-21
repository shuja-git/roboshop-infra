git:
	git pull
dev-apply: git
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-apply -var-file=env-dev/main.tfvars
dev-destroy:
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -auto-apply -var-file=env-dev/main.tfvars