resource "aws_route53_record" "games" {
  zone_id = "Z6J8SXXTH96JX"
  name    = "games.skaaning.ninja"
  type    = "A"

  alias {
    name                   = module.games.cf_domain_name
    zone_id                = module.games.cf_hosted_zone_id
    evaluate_target_health = false
  }
}
