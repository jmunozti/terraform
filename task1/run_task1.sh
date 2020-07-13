#!/bin/bash
echo "Begin"
echo "============================================"

sed -i "s/2020-terraform-state/$s3_bucket/g" main.tf

terraform fmt
terraform init
terraform plan
terraform apply -input=false -auto-approve -var ssh_key="$key_pair"

echo "============================================"
echo "End"
