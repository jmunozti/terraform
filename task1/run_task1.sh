#!/bin/bash
echo "Begin"
echo "============================================"

sed -i "s/2020-terraform-state/$s3_bucket/g" main.tf
sed -i "s/ssh-key/$key_pair/g" terraform.tfvars

terraform fmt
terraform init
terraform plan
terraform apply -input=false -auto-approve

echo "============================================"
echo "End"
