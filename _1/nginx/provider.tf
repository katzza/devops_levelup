terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
  #profile = "reiss" #пока что дефолтный, можно исп-ть для разных профилей, для разных ролей 2-18-52
  # так как у нас дефолтный, не печатаем его
}