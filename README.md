# BLUZELLE TOOLS

## Ansible 
### Validator / sentry node Installation playbook

```sh
ansible-playbook -i hosts.ini 01-system_config.yml -e "ansible_ssh_user=root" ## Prepare all the inventory
ansible-playbook -i hosts.ini 02-install_bluzelle.yml -e "NODE_GROUP=validator" ## Run the valiator node installation
ansible-playbook -i hosts.ini 02-install_bluzelle.yml -e "NODE_GROUP=sentry" ## Run sentry nodes installation
ansible-playbook -i hosts.ini 03-update_peers.yml ## Edit hosts.ini with node ids from previous step and run to update the blzd config on nodes
ansible-playbook -i hosts.ini 04-create_validator.yml ## Run a create validator command
ansible-playbook -i hosts.ini 05-delegate_to_validator.yml ## Delegate more tokens to the validator
ansible-playbook -i hosts.ini 06-reset_bluzelle.yml ## Reset blockchain data and setup again
```

``` -e "ansible_ssh_user=root" ``` means to run initial connection to vms with root user.\
``` -e "NODE_GROUP=validators" ``` means the correct host group to deploy on.\

#### Playbook description
##### 01-system_config.yml:
* Check sudo group
* Create a user
* Add user to the sudo group
* Set passwordless mode for sudo group
* Add ssh-key for user
* Add firewall rules for SSH, Blzd P2P port and Prometheus module

##### 02-install_bluzelle.yml:
* Go installation
* 

##### 03-update_peers.yml:



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
