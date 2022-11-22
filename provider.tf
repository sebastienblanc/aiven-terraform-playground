terraform {
  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">= 3.1"
    }
  }
}
variable "aiven_api_token" {}

provider "aiven" {
  api_token = var.aiven_api_token
}


