resource "aws_acm_certificate" "cert" {
  domain_name       = "games.skaaning.ninja"
  validation_method = "DNS"

  tags = {
    Environment = "prod"
  }

  lifecycle {
    create_before_destroy = true
  }
}
