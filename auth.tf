# Enable the userpass backend authentication method
resource "vault_auth_backend" "userpass" {
  type = "userpass"
  tune {
    listing_visibility = "unauth"
    default_lease_ttl  = "8h" # 8 hours
  }
}

# Create a user entity, 'intern'
resource "vault_identity_entity" "intern" {
    name = "intern"
    policies = [vault_policy.default_userpass_user.name]
    metadata = {
        company = "Foot Locker"
        department = "Information Security"
    }
}
# Create the userpass alias for intern
resource "vault_identity_entity_alias" "intern" {
  name = "intern"
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id = vault_identity_entity.intern.id
}
# Set the initial password for intern
resource "vault_generic_endpoint" "intern" {
  depends_on           = [vault_identity_entity_alias.intern] # depends_on is usually not needed, terraform will resolve code dependencies automatically
  path                 = "auth/userpass/users/${vault_identity_entity_alias.intern.name}"
  ignore_absent_fields = true

  data_json = <<EOT
    {
        "password": "changeme"
    }
    EOT
  lifecycle {
    ignore_changes = [data_json]
  }
}