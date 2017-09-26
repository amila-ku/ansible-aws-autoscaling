# ansible-aws-autoscaling
This creates an aws autoscaling group with one instance running, it creates the security group required withing the default vpc and 
creates aws keypair to connect to the instance.

## Software requirements
Ansible 2.4

## Check execution steps
```ansible-playbook create_aws_resources.yml --skip-tags "destroy" --check
```

## How to create resources
Creates aws server with wordpress running and prometheus, grafana for monitoring the stack

```ansible-playbook create_aws_resources.yml --skip-tags "destroy"
```

## Create resources with different settings
Creates aws server in a aws region and vpc you specify

```ansible-playbook create_aws_resources.yml --skip-tags "destroy" --extra-vars "aws_region=us-west-2 aws_vpc_id=vpc-xxxxx aws_ami_id=ami-6e1a0117"
```

## Destroy created resources
Destroys resources created 

```ansible-playbook create_aws_resources.yml --tags "destroy" 
```


### Disclaimer
Ansible would throw errors on security group creation if the ansible version is less than 2.4. Please update your ansible version.
