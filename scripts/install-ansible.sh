#!/bin/bash

useradd ansible
echo "vagrant" | passwd --stdin ansible

runuser -l ansible -c 'git clone git://github.com/ansible/ansible.git --recursive'  

runuser -l ansible -c 'cd ansible'

runuser -l ansible -c 'git checkout tags/v2.0.0.1-1'

runuser -l ansible -c 'source ./hacking/env-setup '

runuser -l ansible -c 'echo "source /home/ansible/ansible/hacking/env-setup 1>/dev/null 2>&1" >> /home/ansible/.bashrc'


easy_install pip

yum install python-devel -y     # this package is in the "base" yum repo

pip install paramiko PyYAML Jinja2 httplib2 six

runuser -l ansible -c 'ansible --version'
