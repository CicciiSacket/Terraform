terraform {
  required_providers {
    aws = {
        source =  "hashicorp/aws"
        version = "4.9"
    }
  }
}

provider "aws_local" {
    alias = "localstack"
    shared_credentials_files = [" ~/.aws/credentials "]
    profile = "default" #Settato così per localstack
    region = var.region
    # only required for non virtual hosted-style endpoint use case.
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#s3_use_path_style
    s3_use_path_style           = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    default_tags {
        tags = var.tags
    }
  
}

