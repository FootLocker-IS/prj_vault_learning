resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policy_templates/admin.hcl")
}

resource "vault_policy" "kv-v2_owner" {
  name = "kv-v2_owner"
  policy = templatefile("policy_templates/kv-v2_owner.hcl", {
    mount : vault_mount.kv-v2.path
  })
}

resource "vault_policy" "default_userpass_user" {
  name = "default_userpass_user"
  policy = templatefile("policy_templates/userpass_user.hcl", {
    userpass_accessor : vault_auth_backend.userpass.accessor
  })
}

resource "vault_policy" "transit_payment" {
  name = "transit_payment"
  policy = templatefile("policy_templates/transit_payment.hcl", {
    mount : vault_mount.transit.path
    key : vault_transit_secret_backend_key.key.name
  })
}
