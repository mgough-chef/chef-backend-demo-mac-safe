#!/bin/bash

# Get IP address of eth1 or enp0s8 because this is a Vagrant box
#ipaddr=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')
ipaddr=$(ifconfig enp0s8 | awk '/inet addr/{print substr($2,6)}')

# Install the cluster package
dpkg -s chef-backend &> /dev/null || dpkg -i /vagrant/chef-backend_*.deb

# Create cluster configuration file
echo "publish_address '$ipaddr'" >> /etc/chef-backend/chef-backend.rb

# Initialize the cluster
chef-backend-ctl create-cluster --accept-license --yes

# Copy the secret key file to a shared location
[[ -f /vagrant/chef-backend-secrets.json ]] && rm /vagrant/chef-backend-secrets.json
cp /etc/chef-backend/chef-backend-secrets.json /vagrant/chef-backend-secrets.json

# Generate a chef server frontend config
# and copy it to a shared location
[[ -f /vagrant/chef-server.rb.fe1 ]] && rm /vagrant/chef-server.rb.fe1
chef-backend-ctl gen-server-config fe1.chef-demo.com -f /vagrant/chef-server.rb.fe1
