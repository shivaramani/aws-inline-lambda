#!/bin/sh

terraform init
terraform plan
terraform apply --auto-approve