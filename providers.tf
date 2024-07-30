terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.3.0"
    }
  }
}

# Since we are not providing any options here, the VAULT_ADDR and VAULT_TOKEN environment variables need to be set.
provider "vault" {}
