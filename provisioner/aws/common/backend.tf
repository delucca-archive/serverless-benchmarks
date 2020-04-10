terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.57"
  region = var.region
}
