terraform {
    required_version = "1.2.3"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.16"
        }
    }
}

provider "aws" {
  region  = "us-east-1"
}




resource "aws_instance" "JenkinDeploy" {
    ami = "ami-026b57f3c383c2eec"
    count = "1"
    key_name   = "Jenkins"
    instance_type = "t3.large"
    security_groups = ["launch-wizard-1"]
    tags = {
        Name = "JenkinsServer"
    } 
    user_data = file("ELK-Stack.sh")
   

}
