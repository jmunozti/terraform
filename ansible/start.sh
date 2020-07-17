#!/bin/sh
ssh-add terraform2.pem
ansible-playbook -i hosts -u ec2-user main.yml  -v
