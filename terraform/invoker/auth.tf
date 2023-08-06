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

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "nickname"
    required                 = true
    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }
}

resource "random_password" "user" {
  length = 32
}

resource "aws_cognito_user" "name" {
  user_pool_id = aws_cognito_user_pool.pool.id

  username = "dev"
  password = random_password.user.result
}
