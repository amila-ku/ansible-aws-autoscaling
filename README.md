# ansible-aws-autoscaling
This creates an aws autoscaling group with one instance running, it creates the security group required withing the default vpc and 
creates aws keypair to connect to the instance.

## Software requirements
Ansible 2.4

## Dependencies
stack creation depends on below repository
[wp_stack](https://github.com/amila-ku/wordpress-prometheus)

using fixed ec2_lc for ansible 2.4
[bug 30268](https://github.com/ansible/ansible/issues/30268)

## Check execution steps
```shell
ansible-playbook create_aws_resources.yml --skip-tags "destroy" --check
```

## How to create resources
Creates aws server with wordpress running and prometheus, grafana for monitoring the stack

```shell
ansible-playbook create_aws_resources.yml --skip-tags "destroy"
```

## Create resources with different settings
Creates aws server in a aws region and vpc you specify

```shell
ansible-playbook create_aws_resources.yml --skip-tags "destroy" --extra-vars "aws_region=us-west-2 aws_vpc_id=vpc-xxxxx aws_ami_id=ami-6e1a0117"
```

## Destroy created resources
Destroys resources created 

```shell
ansible-playbook create_aws_resources.yml --tags "destroy" 
```

## How to use if not using userdata
add a new userdata file with only installing python

create aws resources

```shell
ansible-playbook create_aws_resources.yml --skip-tags "destroy"
```

run setup playbooks to configure stack

```shell
ansible-playbook setup_stack.yml --private-key=keypair-wpstack.pem
```



### Disclaimer
Ansible would throw errors on security group creation if the ansible version is less than 2.4. Please update your ansible version.


you would run into a bug in ansible version 2.4 when using ec2_lc
[more details](https://github.com/ansible/ansible/issues/30268)

use below file to replace ec2_lc.py in your ansible installation
file location : /usr/lib/python2.7/dist-packages/ansible/modules/cloud/amazon/ec2_lc.py
replace with this https://raw.githubusercontent.com/ansible/ansible/stable-2.4/lib/ansible/modules/cloud/amazon/ec2_lc.py
