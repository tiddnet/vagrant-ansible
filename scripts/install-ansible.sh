#!/bin/bash

git clone git://github.com/ansible/ansible.git --recursive

cd ansible
git checkout tags/v2.0.0.1-1

source ./hacking/env-setup    # I think this needs to be added in the bashrc profile file. 

echo "source /home/vagrant/ansible/hacking/env-setup 1>/dev/null 2>&1" >> /home/vagrant/.bashrc

easy_install pip

yum install python-devel -y     # this package is in the "base" yum repo

pip install paramiko PyYAML Jinja2 httplib2 six


ansible --version