resource "aws_cognito_user_pool" "pool" {
  name                       = "uakino-invoker-pool"
  alias_attributes           = ["preferred_username"]

  account_recovery_setting {
    recovery_mechanism {
      name     = "admin_only"
      priority = 1
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  password_policy {
    minimum_length    = 8
    require_lowercase = false
    require_numbers   = false
    require_symbols   = false
    require_uppercase = false
    temporary_password_validity_days = 1
  }
}

resource "random_password" "user" {
  length = 32
  special = false
}

resource "aws_cognito_user" "name" {
  user_pool_id = aws_cognito_user_pool.pool.id

  username = "dev"
  password = random_password.user.result
}
