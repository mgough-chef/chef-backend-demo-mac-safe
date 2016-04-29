#!/bin/bash

# Get IP address of eth1 because this is a Vagrant box
ipaddr=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')

# Install the cluster package
dpkg -s chef-backend &> /dev/null || dpkg -i /vagrant/chef-backend*

# Join the cluster
chef-backend-ctl join-cluster 192.168.33.215 -p $ipaddr -s /vagrant/secrets.json --accept-license
