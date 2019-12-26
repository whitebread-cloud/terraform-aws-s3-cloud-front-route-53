variable "hostname" {
  type        = string
  description = "Hostname for the web ui"
}

variable "route_53_zone_name" {
  type        = string
  description = "Route 53 zone name"
}

variable "acm_certificate_arn" {
  type        = string
  description = "Certificate arn to be used"
}

variable "s3_web_bucket" {
  type        = string
  description = "S3 bucket for housing the web ui"
}

variable "s3_logs_bucket" {
  type        = string
  description = "S3 bucket housing all of the logs"
}

variable "s3_force_destroy" {
  type        = bool
  default     = false
  description = "Boolean to force termination even if objects remain in s3 bucket"
}

variable "s3_versioning" {
  type        = bool
  default     = false
  description = "Boolean to enable object versio2ning"
}

variable "cloud_front_min_ttl" {
  type        = number
  default     = 0
  description = "Minimum time cloud front will cache a request"
}

variable "cloud_front_default_ttl" {
  type        = number
  default     = 3600
  description = "Default time cloud front will cache a request"
}

variable "cloud_front_max_ttl" {
  type        = number
  default     = 86400
  description = "Maximum time cloud front will cache a request"
}

variable "cloud_front_price_class" {
  type        = string
  default     = "PriceClass_100"
  description = "Cloud Front Price Class. See https://aws.amazon.com/cloudfront/pricing/ for more information"
}

variable "profile" {
  type        = string
  default     = "default"
  description = "AWS profile to use. See https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html for more details"
}
