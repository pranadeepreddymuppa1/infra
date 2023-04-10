resource "aws_secretsmanager_secret" "secret" {
  name = "bermtec_secret"
}


resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.secret_value

  depends_on = [
    aws_secretsmanager_secret.secret
  ]
}