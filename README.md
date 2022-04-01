### Changes

#### To Deploy

terraform init
terraform plan
terraform apply --auto-approve

#### To test
aws lambda invoke --function-name inline_lambda_function --payload "{}" response.json 


#### To destroy
terraform destroy --auto-approve

