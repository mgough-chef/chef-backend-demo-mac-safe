#!/bin/bash

grep -e 192.168.33.215 /etc/hosts || echo 192.168.33.215 be1.chef-demo.com >> /etc/hosts
grep -e 192.168.33.216 /etc/hosts || echo 192.168.33.216 be2.chef-demo.com >> /etc/hosts
grep -e 192.168.33.217 /etc/hosts || echo 192.168.33.217 be3.chef-demo.com >> /etc/hosts

grep -e 192.168.33.218 /etc/hosts || echo 192.168.33.218 fe1.chef-demo.com >> /etc/hosts
