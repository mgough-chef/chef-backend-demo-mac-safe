## About this project

This repo will stand up a chef-backend cluster with a single chef-server front-end node.

*Note:* This demo repo requires chef-backend 0.8.7 or later.

*Note:* This demo repo requires a chef-server-core package built on or after April 22nd, 2016.

The shell scripts in the `/scripts` directory are intended as documentation for building / configuring Chef Server clusters using the chef-backend package.

*NOTE*: The APIs, CLI commands, and config file format are not stable, and are likely to change between nightly releases.

### Prerequisites

* 8GB of free RAM
* The latest chef-server-core and chef-backend .deb packages should be stored in the same directory as this README.
- https://bintray.com/chef/current-apt/chef-backend/view for the nightly chef-backend packages
- https://downloads.chef.io/chef-server/ for the latest release of the chef-server-core package
* Vagrant
* Virtualbox

### Quick Start [Automated]

vagrant up

### Cluster Topology

This will result in a 3-node chef-backend cluster, and a single front-end
node. They are provisioned in the order listed below.

* be1, 192.168.56.215
* be2, 192.168.56.216
* be3, 192.168.56.217
* fe1, 192.168.56.218

### Administering the chef-backend cluster
The chef-backend cluster is administered with the `chef-backend-ctl` command. See the built-in help for details.

*NOTE*: The APIs, CLI commands, and config file format are not stable, and are likely to change between nightly releases.

### Provisioning without Vagrant

Per-node provisioning shell scripts are in the `scripts` directory, and follow the latest manual steps to configure the backend cluster and frontend nodes.
