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
    user_data = <<EOF
    version: "3"
services:
    elasticsearch:
        image: docker.elastic.co/elasticsearch/elasticsearch:7.10.0
        environment:
            - discovery.type=single-node
        ports:
            - 9200:9200
    logstash:
        image: docker.elastic.co/logstash/logstash:7.10.0
        depends_on:
            - elasticsearch
    kibana:
        image: docker.elastic.co/kibana/kibana:7.10.0
        ports:
            - 5601:5601
        depends_on:
            - elasticsearch
    EOF
}
   

}
