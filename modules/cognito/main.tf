resource "aws_cognito_user_pool" "clinc_pool" {
  name = var.clinc_name

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }

    recovery_mechanism {
      name     = "verified_phone_number"
      priority = 2
    }
  }

  tags = {
    clinc = var.clinc_name
  }
}

resource "aws_cognito_user_pool_client" "clinc_pool_client" {
  name                                 = "client"
  user_pool_id                         = aws_cognito_user_pool.clinc_pool.id
  callback_urls                        = [var.callback_url]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid", "phone"]
  supported_identity_providers         = ["COGNITO"]
  generate_secret                      = true
}


