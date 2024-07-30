
path "${mount}/keys/*" {
    capabilities = ["read", "list"]
}
path "${mount}/encrypt/${key}" {
    capabilities = ["update"]
}
path "${mount}/sign/${key}" {
    capabilities = ["update"]
}
path "${mount}/verify/${key}" {
    capabilities = ["update"]
}
