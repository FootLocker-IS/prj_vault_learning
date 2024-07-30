# prj_vault_learning
Vault Learning Project

Running the Vault server in Dev Mode - Run this in a dedicated terminal window
To run the vault server in dev mode (we are explicitly setting the root token value for simplicity):
```
vault server -dev -dev-root-token-id root
```

Configuration as code steps
To initialize terraform and download providers:
```
terraform init
```
To format your code (optional):
```
terraform fmt
```
To validate your code (check for errors):
```
terraform validate
```
To apply the terraform:
```
terraform apply
```