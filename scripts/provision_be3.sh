#!/bin/bash

# Install the cluster package
dpkg -s chef-backend || dpkg -i /vagrant/chef-backend*

# Create cluster configuration directory
mkdir -p /etc/chef-backend

# Create cluster configuration file
cat > /etc/chef-backend/chef-backend.rb <<EOF
peers ['192.168.33.215', '192.168.33.216']
publish_address '192.168.33.217'
vip "192.168.33.220"
vip_interface "eth1"
EOF

# Copy the secret key file from the shared location
[[ -f /etc/chef-backend/secrets.json ]] || \
cp /vagrant/secrets.json /etc/chef-backend/secrets.json

# Join the cluster
chef-backend-ctl reconfigure
