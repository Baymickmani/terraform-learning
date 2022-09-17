resource "aws_wafv2_ip_set" "my-network-ips" {
  name               = "my-network-ips"
  description        = "IP set containing my Network IP addresses"
  scope              = "CLOUDFRONT"
  ip_address_version = "IPV4"
  addresses          = ["175.101.105.136/32"]
}

resource "aws_wafv2_web_acl" "web-acl" {
  name        = "terraformacl"
  description = "Firewall that protects the S3 bucket objects from Unknown IPs"
  scope       = "CLOUDFRONT"
  default_action {
    block {}
  }
  
  rule {
    action {
      allow {}
    }
    name     = "my-network-ips-rule"
    priority = 0
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.my-network-ips.arn
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "ip-set-metric"
      sampled_requests_enabled   = true
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "waf-metric"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "association" {
    resource_arn = data.aws_cloudfront_distribution.test.arn
    web_acl_arn = aws_wafv2_web_acl.web-acl.arn
}

data "aws_cloudfront_distribution" "test" {
  id = "E1EXYFPZMJV402"
}