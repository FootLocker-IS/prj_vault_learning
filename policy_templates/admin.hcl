path "*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "access/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "secrets/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "policies/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "tools/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "sys/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "sys/*/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}
path "sys/*/*/*" {
    capabilities = ["read", "create", "list", "delete", "sudo", "update"]
}