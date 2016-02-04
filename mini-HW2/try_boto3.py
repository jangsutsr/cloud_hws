import boto3
from time import sleep

ec2 = boto3.resource('ec2')
instances = []
METAS = {
    'ImageId': 'ami-60b6c60a',
    'KeyName': 'jangsutsr',
    'InstanceType': 't2.micro'
}

def create_instance():
    if len(instances) >= 1:
        print('At most ' + str(1) + ' instance(s) is allowed to co-exist')
    else:
        rc = ec2.create_instances(
            ImageId=METAS['ImageId'],
            MaxCount=1,
            MinCount=1,
            KeyName=METAS['KeyName'],
            InstanceType=METAS['InstanceType']
        )
        instances.append(rc[0])
        instances[-1].monitor(DryRun=False)

def terminate_instance():
    if instances == []:
        print('No instance to terminate')
    else:
        to_terminate = instances.pop()
        to_terminate.terminate()

if __name__ == '__main__':
    while True:
        order = raw_input('Give orders, please: (available: create, show, terminate, exit) ')
        if order == 'create': create_instance()
        elif order == 'terminate': terminate_instance()
        elif order == 'show': print instances[-1].public_dns_name
        elif order == 'exit': break
        else:
            print('Invalid order')
