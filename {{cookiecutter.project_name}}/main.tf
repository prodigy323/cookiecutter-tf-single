###############################
# VERSIONS
###############################
terraform {
  required_version = "~> {{ cookiecutter.terraform_version }}"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= {{ cookiecutter.aws_provider_version }}"
    }
  }
}

###############################
# PROVIDERS
###############################
# https://registry.terraform.io/providers/hashicorp/aws/latest
provider "aws" {
  region  = local.region
  profile = local.profile

  default_tags {
    tags = {
      Project = local.project_name
    }
  }
}

###############################
# LOCALS
###############################
locals {
  region = "{{ cookiecutter.aws_region }}"
  profile = "{{ cookiecutter.project_profile }}"
  project_name = "{{ cookiecutter.project_name }}"
}

###############################
# DATA SOURCES
###############################
# https://developer.hashicorp.com/terraform/language/data-sources
data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}
data "aws_organizations_organization" "this" {}


###############################
# MODULES
###############################



###############################
# RESOURCES
###############################



###############################
# OUTPUTS
###############################

output "account-id" {
  value = data.aws_caller_identity.current.account_id
}

output "azs" {
  value = data.aws_availability_zones.available.names
}

output "aws-org-id" {
  value = data.aws_organizations_organization.this.id
}
