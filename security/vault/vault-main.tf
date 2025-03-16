resource "vault_generic_secret" "db_creds" {
  path = "secret/ecommerce/db"

  data_json = jsonencode({
    username = "admin",
    password = "supersecurepassword"
  })
}

resource "vault_generic_secret" "api_keys" {
  path = "secret/ecommerce/api"

  data_json = jsonencode({
    stripe_key = "sk_test_123456",
    aws_secret = "aws_secret_key_here"
  })
}
