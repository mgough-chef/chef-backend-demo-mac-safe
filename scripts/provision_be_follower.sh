#!/bin/bash

# Get IP address of eth1 or enp0s8 because this is a Vagrant box
ipaddr=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')
#ipaddr=$(ifconfig enp0s8 | awk '/inet addr/{print substr($2,6)}')

# Install the cluster package
dpkg -s chef-backend &> /dev/null || dpkg -i /vagrant/chef-backend_*.deb

#Modify embedded cookbooks to change ElasticSearch jvm.options
esjvmopts="/opt/chef-backend/embedded/cookbooks/chef-backend/templates/default/es_jvm.opts.erb"
cat >> $esjvmopts <<EOF 
-XX:+UnlockExperimentalVMOptions
-XX:+UseZGC
EOF
sed -i '/ConcMark/d;/CMS/d' $esjvmopts

# Join the cluster
chef-backend-ctl join-cluster 192.168.56.215 -p $ipaddr -s /vagrant/chef-backend-secrets.json --accept-license --yes
