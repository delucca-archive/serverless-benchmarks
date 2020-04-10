variable "region" {
  description = "This variable defines which region should our AWS provider use."
  type = string
  default = "us-east-1"
}

variable "provisioner" {
  description = "This variable defines our resources' provisioner name."
  type = string
  default = "Terraform"
}

variable "scope" {
  description = "This variable defines the default scope to tag all benchmark resources."
  type = string
  default = "Serverless Benchmark"
}
