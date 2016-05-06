#!/bin/bash

# http://docs.ansible.com/ansible/intro_installation.html#latest-release-via-yum
echo "INFO: About to run scripts/install-ansible.sh"
yum install python-devel -y  || exit 1     # this package is in the "base" yum repo
yum install python2-crypto -y  || exit 1
yum install asciidoc -y  || exit 1
yum install rpm-build -y  || exit 1

cd /tmp ||  exit 1
git clone git://github.com/ansible/ansible.git --recursive  || exit 1
cd ansible  || exit 1
make rpm  || exit 1
#git checkout tags/v2.0.0.1-1  || exit 1
cd rpm-build/  || exit 1
yum localinstall ansible-*.noarch.rpm -y  || exit 1

echo "line 14"
echo "INFO: Ansible has been successfully installed"
yum info ansible  || exit 1

exit 0


