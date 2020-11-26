provider "aws"{
region = "us-west-2"

}

resource "aws_instance" "myinst"{
ami = "ami-07a0da1997b55b23e"
instance_type = "t2.micro"
tags = {
Name = "Instance-1"
}
vpc_security_group_ids = ["sg-01087793dd7fe84d8"]
count = 1
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "myterrbukinfy"
    key            = "mytfstatefile/terraform.tfstate"
    region         = "us-west-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "myterrtabinfy"
    encrypt        = true
  }
}


