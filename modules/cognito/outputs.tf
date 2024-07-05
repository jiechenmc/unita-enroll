output "client_id" {
  value = aws_cognito_user_pool_client.clinc_pool_client.id
}

output "client_issuer" {
  value = aws_cognito_user_pool.clinc_pool.endpoint
}

output "client_secret" {
  value = aws_cognito_user_pool_client.clinc_pool_client.client_secret
}
