## About this project

This repo will stand up a chef-backend cluster with a single chef-server front-end node.

### Prerequisites

* 8GB of free RAM
* The latest chef-server-core and chef-backend .deb packages should be stored in the same directory as this README.
* Vagrant
* Virtualbox

### Quick Start [Automated]

vagrant up

### Cluster Topology

This will result in a 3-node chef-backend cluster, and a single front-end
node.

* be1, 192.168.33.215
* be2, 192.168.33.216
* be3, 192.168.33.217

* Backend-VIP: 192.168.33.220 - This is an IP that will be automatically assigned to the primary node in the backend cluster.

* fe1, 192.168.33.218

### Provisioning without Vagrant

Per-node provisioning shell scripts are in the `scripts` directory, and follow the latest manual steps to configure the backend cluster and frontend nodes.
