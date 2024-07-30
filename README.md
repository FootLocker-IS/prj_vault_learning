# prj_vault_learning
Vault Learning Project

### Pre-requisites (This can be completed by running the InstallScript.ps1 instead)
1. Download Vault
2. Download Terraform
3. Add them to PATH for convenience

### Running the Vault server in Dev Mode - Run this in a dedicated terminal window <br/>
To run the vault server in dev mode (we are explicitly setting the root token value for simplicity):
```
vault server -dev -dev-root-token-id root
```
Set the VAULT_ADDR environment variable:
```
# Permanent environment variable
[Environment]::SetEnvironmentVariable("VAULT_ADDR", "http://127.0.0.1:8200", [System.EnvironmentVariableTarget]::User)
# Only set the environment variable for the active powershell session
$env:VAULT_ADDR="http://127.0.0.1:8200"
```
Set the VAULT_TOKEN environment variable:
```
# Only set the environment variable for the active powershell session
$env:VAULT_TOKEN="root"
```

### Configuration as code steps <br/>
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