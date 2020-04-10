variable "cidr_blocks" {
  description = "This variable defines which CIDR block to use on our VPC."
  type = object({
    vpc = string
    subnet = string
    route_table = string
  })
  default = {
    vpc = "10.0.0.0/16"
    subnet = "10.0.%d.0/24"
    route_table = "0.0.0.0/0"
  }
}

variable "name" {
  description = "This variable defines the name of our created resources."
  type = string
  default = "serverless-benchmarks-vpc"
}

variable "subnet_count" {
  description = "This variable defines the number of subnets to create."
  type = number
  default = 2
}
