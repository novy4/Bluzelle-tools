# BLUZELLE TOOLS

## Ansible 
### Validator / sentry node Installation playbook

```sh
ansible-playbook -i hosts.ini install.yml -e "NODE_GROUP=sentry" -t sentry --ask-become-pass ## to run a sentry node installation
ansible-playbook -i hosts.ini install.yml -e "NODE_GROUP=validator" -t validator --ask-become-pass ## to run a valiator node installation
ansible-playbook -i hosts.ini new-user.yml -e "NODE_GROUP=validator" ## to create a user with homepage and add your pubkey in ~/.ssh
```

``` -e "NODE_GROUP=validators" ``` means the correct host group to deploy on\
``` -t sentry ``` means to deploy sentry on selected host group\
``` -t validator ``` means to deploy validator on selected host group

## Hetzner node deploy 
### hcloud.sh - setup of 3 vms, validator + 2 sentries, all of them are located in different DCs.

```sh
hcloud server create --datacenter fsn1-dc14 --name validator.bluzelle.novy.pw --ssh-key "key-id"  --type cpx31 --image 168855
hcloud server create --datacenter hel1-dc2 --name sentry1.bluzelle.novy.pw --ssh-key "key-id"  --type cpx31 --image 168855
hcloud server create --datacenter nbg1-dc3 --name sentry2.bluzelle.novy.pw --ssh-key "key-id"  --type cpx31 --image 168855
```

``` --datacenter 'select in which datacenter to deploy the node' 
``` --name 'the name of the VM'
``` --ssh-key 'your ssh key in hetzner project'
``` --type 'the type of the virtual machine'
``` --image 'provisioned operatin system, 168855 means ubuntu 18.04'
