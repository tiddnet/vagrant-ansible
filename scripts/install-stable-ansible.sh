#!/bin/bash

yum install -y epel-release || exit 1
yum install -y ansible  || exit 1

yum install -y facter || exit 1

exit 0


