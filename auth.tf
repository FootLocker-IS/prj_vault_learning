# Enable the userpass backend authentication method
resource "vault_auth_backend" "userpass" {
  type = "userpass"
  tune {
    listing_visibility = "unauth"
    default_lease_ttl  = "8h" # 8 hours
  }
}

# Create a user, 'intern'
resource "vault_generic_endpoint" "intern" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/intern"
  ignore_absent_fields = true

  data_json = <<EOT
    {
        "policies": ["${vault_policy.kv-v2_owner.name}", "${vault_policy.default_userpass_user.name}", "${vault_policy.transit_payment.name}"],
        "password": "changeme"
    }
    EOT
#   lifecycle {
#     ignore_changes = [data_json]
#   }
}