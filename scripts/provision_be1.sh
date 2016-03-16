#!/bin/bash

# Install the cluster package
dpkg -s chef-backend || dpkg -i /vagrant/chef-backend*

# Create cluster configuration directory
mkdir -p /etc/chef-backend

# Create cluster configuration file
cat > /etc/chef-backend/chef-backend.rb <<EOF
peers ['192.168.33.216','192.168.33.217']
publish_address '192.168.33.215'
vip "192.168.33.220"
vip_interface "eth1"
EOF

# Initialize the cluster
chef-backend-ctl bootstrap

# Copy the secret key file to a shared location
[[ -f /vagrant/secrets.json ]] && rm /vagrant/secrets.json
cp /etc/chef-backend/secrets.json /vagrant/secrets.json

# Generate a chef server frontend config
# and copy it to a shared location
[[ -f /vagrant/chef-server.rb.fe1 ]] && rm /vagrant/chef-server.rb.fe1
chef-backend-ctl gen-server-config fe1.chef-demo.com > /vagrant/chef-server.rb.fe1
