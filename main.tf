provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "inst"{

ami = "ami-08f63db601b82ff5f"
instance_type = "t2.small"
vpc_security_group_ids = ["sg-0673c2bba90be2d92"]
associate_public_ip_address = "true"
key_name = "mykeypair"


}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "pvkbuck"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "ptable"
    encrypt        = true
  }
}
