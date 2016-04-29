#!/bin/bash

# Get IP address of eth1 because this is a Vagrant box
ipaddr=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')

# Install the cluster package
dpkg -s chef-backend &> /dev/null || dpkg -i /vagrant/chef-backend*

# Create cluster configuration file
echo "publish_address '$ipaddr'" >> /etc/chef-backend/chef-backend.rb

# Initialize the cluster
chef-backend-ctl bootstrap

# Copy the secret key file to a shared location
[[ -f /vagrant/secrets.json ]] && rm /vagrant/secrets.json
cp /etc/chef-backend/secrets.json /vagrant/secrets.json

# Generate a chef server frontend config
# and copy it to a shared location
[[ -f /vagrant/chef-server.rb.fe1 ]] && rm /vagrant/chef-server.rb.fe1
chef-backend-ctl gen-server-config fe1.chef-demo.com > /vagrant/chef-server.rb.fe1
