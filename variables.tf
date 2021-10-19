variable "vpc_id" {
  description = "The target VPC for hosting the GitLab Runner"
  type        = string
  default     = "vpc-4240252b"
  
}

variable "subnet_ids" {
  description = "List of subnets for hosting the GitLab Runner"
  type        = list(string)
  default     = ["subnet-da65f2b3"]
}

variable "key_name" {
  description = "The name of the EC2 key pair to use"
  type        = string
  default     = "sshkey-terraform"
}

variable "enable_ssh_access" {
  description = "Enables SSH access to the GitLab Runner"
  type        = bool
  default     = true
}

variable "ssh_cidr_blocks" {
  description = "List of CIDR blocks to use if allowing SSH Access to the GitLab Runner"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "gitlab_runner_registration_config" {
  description = "Configuration used to register the runner"
  type        = map(string)

  default = {
    url                = "https://git.site.net"
    name               = "qa-runner"
    registration_token = "SDAFASDFAFf"
    docker_image       = "alpine:latest"
  }
}

variable "gitlab_runner_concurrency" {
  description = "Maximum number of jobs to allow the GitLab Runner to run concurrently"
  type        = number
  default     = 10
}

variable "aws_region" {
  type = string
  default = "eu-west-3"
}

provider "aws" {
  region = var.aws_region
} 
