output "db_secret_path" {
  value = vault_generic_secret.db_creds.path
}

output "api_secret_path" {
  value = vault_generic_secret.api_keys.path
}
