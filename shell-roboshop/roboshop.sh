#!/bin/bash


AMI_ID=09c813fb71547fc4f
SG_ID=0fd0aa1e150fc139a


for instance in $@

do
    INSTANCE_ID=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-0fd0aa1e150fc139a --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --query 'Instances[0].InstanceId' --output text)

    if [ $instance != "frontend"]; then
        IP=$(aws ec2 describe-instances --instance-ids i-00c45926d95a65066 --query 'Reservations[0].Instances[0].privateIpAddress' --output text)
    else
        IP=$(aws ec2 describe-instances --instance-ids i-00c45926d95a65066 --query 'Reservations[0].Instances[0].
        publicIpAddress' --output text)
    fi
        echo "$instance: $IP"
done

