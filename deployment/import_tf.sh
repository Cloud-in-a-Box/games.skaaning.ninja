#!/usr/bin/env bash
rm plan.tf || true

../terraform init

../terraform import module.games.aws_cloudfront_origin_access_identity.default[0] E12W39SWYQX4MM || true
../terraform import module.games.module.logs.aws_s3_bucket.default[0] skaaningninja-prod-games-logs || true
../terraform import module.games.aws_s3_bucket_policy.default[0] skaaningninja-prod-games-origin || true
../terraform import module.games.module.logs.aws_s3_bucket_public_access_block.default[0] skaaningninja-prod-games-logs || true
../terraform import module.games.aws_s3_bucket.origin[0] skaaningninja-prod-games-origin || true
../terraform import module.games.aws_cloudfront_distribution.default E1LGWUXYTVR36A || true

../terraform import aws_route53_record.games Z6J8SXXTH96JX_games.skaaning.ninja_A || true

../terraform plan -out plan.tf
../terraform apply plan.tf
