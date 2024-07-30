path "${mount}/data/*" {
    capabilities = ["read", "list", "create", "update", "delete"]
}
path "${mount}/delete/*" {
    capabilities = ["update"]
}
path "${mount}/undelete/*" {
    capabilities = ["update"]
}
path "${mount}/destroy/*" {
    capabilities = ["update"]
}
path "${mount}/metadata/*" {
    capabilities = ["read", "list", "update", "delete"]
}
path "${mount}/metadata" {
    capabilities = ["list"]
}