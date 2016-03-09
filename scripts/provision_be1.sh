#!/bin/bash

dpkg -s chef-backend || dpkg -i /vagrant/chef-backend*

mkdir -p /etc/chef-backend

cat > /etc/chef-backend/chef-backend.rb <<EOF
peers ['192.168.33.216','192.168.33.217']
publish_address '192.168.33.215'
vip "192.168.33.220"
vip_interface "eth1"
EOF

chef-backend-ctl bootstrap

[[ -f /vagrant/secrets.json ]] && rm /vagrant/secrets.json
cp /etc/chef-backend/secrets.json /vagrant/secrets.json

[[ -f /vagrant/chef-server.rb.fe1 ]] && rm /vagrant/chef-server.rb.fe1
chef-backend-ctl gen-server-config fe1.chef-demo.com > /vagrant/chef-server.rb.fe1
