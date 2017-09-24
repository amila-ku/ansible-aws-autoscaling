#!/bin/bash

sudo yum update -y
sudo yum install -y docker git
sudo usermod -a -G docker ec2-user
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo git clone https://github.com/amila-ku/wordpress-prometheus.git /wp
cd /wp
docker compose up -d
