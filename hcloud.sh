### DC1 ###
hcloud server create --datacenter fsn1-dc14 --name validator.bluzelle.novy.pw --ssh-key "key-id"  --type cpx31 --image 168855

### DC2 ###
hcloud server create --datacenter hel1-dc2 --name sentry1.bluzelle.novy.pw --ssh-key "key-id"  --type cpx31 --image 168855

### DC3 ###
hcloud server create --datacenter nbg1-dc3 --name sentry2.bluzelle.novy.pw --ssh-key "key-id"  --type cpx31 --image 168855
