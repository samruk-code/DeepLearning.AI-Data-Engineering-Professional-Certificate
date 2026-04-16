#!/bin/bash
set -e
export de_project="de-c2w3lab2"
export AWS_DEFAULT_REGION="us-east-1"
export VPC_ID=$(aws ec2 describe-vpcs --filter Name=tag:Name,Values=$de_project --query Vpcs[].VpcId --output text)

echo "export TF_VAR_project=$de_project" >> $HOME/.bashrc
echo "export TF_VAR_region=$AWS_DEFAULT_REGION" >> $HOME/.bashrc
echo "export TF_VAR_vpc_id=$VPC_ID" >> $HOME/.bashrc
echo "export TF_VAR_public_subnet_id=$(aws ec2 describe-subnets --filters "Name=tag:aws:cloudformation:logical-id,Values=PublicSubnet" "Name=vpc-id,Values=$VPC_ID" --output text --query "Subnets[].SubnetId")" >> $HOME/.bashrc
echo "export TF_VAR_private_subnet_a_id=$(aws ec2 describe-subnets --filters "Name=tag:aws:cloudformation:logical-id,Values=PrivateSubnetA" "Name=vpc-id,Values=$VPC_ID" --output text --query "Subnets[].SubnetId")" >> $HOME/.bashrc
echo "export TF_VAR_private_subnet_b_id=$(aws ec2 describe-subnets --filters "Name=tag:aws:cloudformation:logical-id,Values=PrivateSubnetB" "Name=vpc-id,Values=$VPC_ID" --output text --query "Subnets[].SubnetId")" >> $HOME/.bashrc
source $HOME/.bashrc

# Final success message
echo "Setup completed successfully. All environment variables and Terraform backend configurations have been set."