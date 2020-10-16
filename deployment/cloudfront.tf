provider "aws" {
  region = "eu-west-1"
}

module "games" {
  source                    = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=master"
  namespace                 = "skaaningninja"
  stage                     = "prod"
  name                      = "games"
  aliases                   = ["games.skaaning.ninja"]
  acm_certificate_arn       = "arn:aws:acm:us-east-1:368263227121:certificate/9ad7b542-4be1-4be6-b138-bd47f00dda40"
  parent_zone_id            = "Z6J8SXXTH96JX"
  cors_allowed_methods      = ["GET"]
  cors_allowed_origins      = ["*"]
  cors_allowed_headers      = ["Authorization", "*"]
  bucket_domain_format      = "%s.s3.amazonaws.com"
}
