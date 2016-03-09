#!/bin/bash

dpkg -s chef-backend || dpkg -i /vagrant/chef-backend*

mkdir -p /etc/chef-backend

cat > /etc/chef-backend/chef-backend.rb <<EOF
peers ['192.168.33.215', '192.168.33.217']
publish_address '192.168.33.216'
vip "192.168.33.220"
vip_interface "eth1"
EOF

[[ -f /etc/chef-backend/secrets.json ]] || \
cp /vagrant/secrets.json /etc/chef-backend/secrets.json

chef-backend-ctl reconfigure
