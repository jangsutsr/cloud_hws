instance=`aws ec2 run-instances \
  --image-id ami-60b6c60a \
  --count 1 \
  --instance-type t2.micro \
  --key-name jangsutsr`

instance_id=`echo $instance | jsawk 'return this.Instances[0].InstanceId'` 

echo "Instance ID: $instance_id"
echo 'Create AMI whenever you are ready'
read command

aws ec2 create-image \
  --instance-id $instance_id \
  --name 'He He Ni Yi Lian'
