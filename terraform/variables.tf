variable "region" {
  description = "AWS region for deployment"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
}

variable "route53_zone_id" {
  description = "Route 53 Hosted Zone ID for testte.pp.ua"
  type        = string
}

variable "github_tag" {
  description = "GitHub tag to use in DNS (e.g., v12)"
  type        = string
}