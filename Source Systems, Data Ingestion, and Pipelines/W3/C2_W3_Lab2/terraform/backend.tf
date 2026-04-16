# Configure the backend for Terraform using Local Backend
terraform {
  backend "local" {
    path = "/home/coder/.local/share/code-server/User/terraform.state"
  }
}
