# Include the definition of the variables you will use throughout the
# definition of resources.

variable "project" {
  type        = string
  description = "The name of the project"
  default     = "de-c2w3lab2"
}

variable "region" {
  type        = string
  description = "The AWS region to use for provisioning"
  default     = "us-east-1"
}

variable "rds_instance_id" {
  type        = string
  description = "The RDS instance ID"
}

variable "bastion_host_id" {
  type        = string
  description = "The Bastion Host EC2 instance ID"
}

variable "notification_email" {
  type        = string
  description = "Notification email for the CloudWatch alert"
}