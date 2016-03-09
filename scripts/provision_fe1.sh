#!/bin/bash

dpkg -s chef-server-core || dpkg -i /vagrant/chef-server-core*

mkdir -p /etc/opscode

[[ -s /etc/opscode/chef-server.rb ]] || \
cp /vagrant/chef-server.rb.fe1 /etc/opscode/chef-server.rb

[[ -f /etc/opscode/private-chef-secrets.json ]] || \
chef-server-ctl reconfigure
