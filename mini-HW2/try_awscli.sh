#!usr/bin/bash

if [ -e "instance_info.json" ]; then
  rm instance_info.json
fi
aws ec2 run-instances \
  --image-id ami-60b6c60a \
  --count 1 \
  --instance-type t2.micro \
  --key-name jangsutsr \
  > instance_info.json
string=`cat instance_info.json | grep InstanceId`
trim_tail=${string%\"*}
code=${trim_tail##*\"}
echo "Instance $code is launched successfully. "
while true; do
  printf 'Enter order please (available: show, exit):'
  read command
  if [ $command = 'show' ]; then
    echo `aws ec2 describe-instances --no-dry-run --instance-ids $code --query 'Reservations[].Instances[].PublicDnsName'` 
  elif [ $command = 'exit' ]; then
    break
  else
    echo 'Invalid order.'
  fi
done
