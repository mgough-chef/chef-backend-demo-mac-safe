#!/bin/bash

# Install the Chef Server package
dpkg -s chef-server-core || dpkg -i /vagrant/chef-server-core*

# Create chef server configuration directory
mkdir -p /etc/opscode

# Copy the chef server configuration file from the shared location
[[ -s /etc/opscode/chef-server.rb ]] || \
cp /vagrant/chef-server.rb.fe1 /etc/opscode/chef-server.rb

# Attach the chef server to the existing backend-cluster
[[ -f /etc/opscode/private-chef-secrets.json ]] || \
chef-server-ctl reconfigure
