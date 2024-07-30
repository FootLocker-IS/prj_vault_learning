# Enable K/V v2 secrets engine at 'kv-v2'
resource "vault_mount" "kv-v2" {
  path        = "kv-v2"
  type        = "kv-v2"
  description = "KV-V2 secrets engine with default settings"
}

# Enable Transit secrets engine at 'transit'
resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"
}

# Creating an encryption key named 'payment'
resource "vault_transit_secret_backend_key" "key" {
  depends_on       = [vault_mount.transit] # depends_on is not needed. Terraform will automatically resolve dependencies properly 99.9% of the time.
  backend          = "transit"
  name             = "payment"
  deletion_allowed = true
}
