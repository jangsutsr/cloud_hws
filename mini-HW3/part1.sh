instance=`aws ec2 run-instances \
  --image-id ami-60b6c60a \
  --count 1 \
  --instance-type t2.micro \
  --key-name jangsutsr`

instance_id=`echo $instance | jsawk 'return this.Instances[0].InstanceId'` 
instance_zone=`echo $instance | jsawk 'return this.Instances[0].Placement.AvailabilityZone'`

volume=`aws ec2 create-volume \
  --size 8 \
  --availability-zone $instance_zone \
  --volume-type gp2` 
 
echo $volume | jsawk 'return this.VolumeId'
echo $instance_id

echo 'Attach whenever you are ready'
read command

echo `aws ec2 describe-instances \
  --no-dry-run \
  --instance-ids $instance_id \
  --query 'Reservations[].Instances[].PublicDnsName'` 

aws ec2 attach-volume \
  --volume-id `echo $volume | jsawk 'return this.VolumeId'` \
  --instance-id $instance_id \
  --device '/dev/sdh'

echo 'Attach Successful'
