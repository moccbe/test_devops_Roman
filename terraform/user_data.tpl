#!/bin/bash

yum update -y
amazon-linux-extras enable python3.8
yum clean metadata
yum install -y python3.8 python3-pip
alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
echo "Setup complete."
