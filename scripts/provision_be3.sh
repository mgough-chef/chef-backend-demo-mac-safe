#!/bin/bash

# Install the cluster package
dpkg -s chef-backend || dpkg -i /vagrant/chef-backend*

# Join the cluster
chef-backend-ctl join-cluster 192.168.33.215 -p 192.168.33.217 -s /vagrant/secrets.json
