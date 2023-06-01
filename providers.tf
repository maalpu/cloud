# Trabajar con las constrains

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0.0"
      # version = ">=4.36.0, !=4.43.0, < 4.47.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = "~>1.4.0"
}

provider "aws" {
  region = "us-east-1"
<<<<<<< HEAD
=======
  access_key = var.access_key
  secret_key = var.secret_key
>>>>>>> f4e9f8e6e74f54b68dd74918812438260782254a
  default_tags {
    tags = var.tags
  }
}
