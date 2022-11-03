provider "aws" {
  region  = "us-east-1"
}




resource "aws_instance" "ELK" {
    ami = "ami-026b57f3c383c2eec"
    count = "1"
    key_name   = "Jenkins"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-1"]
    tags = {
        Name = "ELK-Stack"
    } 
    user_data =  <<EOF
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
