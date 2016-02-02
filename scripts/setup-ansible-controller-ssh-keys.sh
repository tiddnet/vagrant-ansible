#!/bin/bash
echo "INFO: About to run setup-ansible-controller-ssh-keys.sh"

cp /vagrant/files/ssh-keys/controller/.ssh /home/ansible/ -rf

chown --recursive ansible:ansible /home/ansible/.ssh

chmod 700 /home/ansible/.ssh

chmod 600 /home/ansible/.ssh/id_rsa
chmod 644 /home/ansible/.ssh/id_rsa.pub
chmod 644 /home/ansible/.ssh/known_hosts

# this disables RSA fingerprint checking when connecting to a new host. 
echo "
Host *
    StrictHostKeyChecking no
" > /home/vagrant/.ssh/config