#!/bin/bash
# ecs deployment made for couple of hours

cd deployment/
source credentials.sh

cd ../docker-image/
rm -rf .terraform
terraform init
terraform apply -target module.docker-image-build.null_resource.deploy --input=false -auto-approve

cd ../deployment
rm -rf .terraform
terraform init
terraform apply --input=false -auto-approve -var "public_key=$SSH_PUBLIC_KEY"

cd ../docker-image
terraform init
terraform apply -target module.docker-image-push.null_resource.deploy -var "account_URL=$ACCOUNT_URL" --input=false -auto-approve