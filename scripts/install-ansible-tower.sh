#!/bin/bash
yum -y install git vim




-### Install awscli
/usr/bin/yum -y install python
/usr/bin/yum -y install bind-utils    # this might be optional, it installs the nslookup utility.
/usr/bin/yum -y install python-pip
/usr/bin/yum -y install jq 
/usr/bin/pip install --upgrade pip    # optional step
/usr/bin/pip install awscli

### Configure aws
runuser -l -u centos -c "/usr/bin/mkdir ~/.aws"
runuser -l -u centos -c "usr/bin/chmod 755 ~/.aws"
runuser -l -u centos -c "usr/bin/echo "[default]" > ~/.aws/config"
runuser -l -u centos -c "usr/bin/echo "output = json" > ~/.aws/config"
runuser -l -u centos -c "usr/bin/echo "region = eu-west-1" >> ~/.aws/config"
runuser -l -u centos -c "usr/bin/chmod 600 ~/.aws/config"


# http://docs.ansible.com/ansible-tower/2.4.5/html/installandreference/install_notes_reqs.html#ir-general-install-notes

yum -y install epel-release
yum -y install ansible
yum -y install wget

cd ~

wget https://releases.ansible.com/awx/setup/ansible-tower-setup-latest.tar.gz

tar xvzf ansible-tower-setup-latest.tar.gz

# rm ansible-tower-setup-latest.tar.gz

cd ansible-tower-setup*



#./configure        # this starts up an interactive shell, prompting for more info.

# Should be able to create an answers file called tower_setup_conf.yml:
# http://docs.ansible.com/ansible-tower/2.4.5/html/installandreference/tower_install_wizard.html#ir-install-arguments

# Here's what my one looked like:

# $ cat tower_setup_conf.yml
echo 'admin_password: password' > tower_setup_conf.yml
echo 'configure_private_vars: {}' >> tower_setup_conf.yml
echo 'database: internal' >> tower_setup_conf.yml
echo 'munin_password: password' >> tower_setup_conf.yml
echo 'pg_password: pAPQZLDuwPbuGs9VAw4yV3XnRKiecqtUxoS5ZzN8'  >> tower_setup_conf.yml
echo 'primary_machine: localhost' >> tower_setup_conf.yml
echo 'redis_password: 7u7Kre9QrNSHpkBu8B4T9bLc8a7pBsfSgh3rT74Y' >> tower_setup_conf.yml


echo '[primary]' > inventory
echo 'localhost' >> inventory
echo '[all:vars]' >> inventory





# need to mount at least 10GB onto /var
# http://docs.ansible.com/ansible-tower/2.4.5/html/installandreference/requirements_refguide.html

# The following fdisk bit work if you have a second block device attached with the name /dev/xvdb
# DO NOT INDENT THIS SECTION
fdisk -u /dev/xvdb <<EOF
n
p
1


t
83
p
w
EOF


mkfs.xfs /dev/xvdb1
echo "/dev/xvdb1   /var/lib/awx        xfs    defaults 1 2" >> /etc/fstab

mkdir -p /var/lib/awx
mount -a


# http://docs.ansible.com/ansible-tower/2.4.5/html/installandreference/tower_install_wizard.html#ir-install-arguments
/root/ansible-tower-setup*/setup.sh



exit 0


