# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = '1024'
    vb.cpus = 2
  end

  config.vm.provision :shell, path: "scripts/provision_hostsfile.sh"

  config.vm.define :be1 do |be1|
    be1.vm.hostname = 'be1'
    be1.vm.network :private_network, ip: '192.168.33.215'
    be1.vm.provision :shell, path: "scripts/provision_be1.sh"
  end

  config.vm.define :be2 do |be2|
    be2.vm.hostname = 'be2'
    be2.vm.network :private_network, ip: '192.168.33.216'
    be2.vm.provision :shell, path: "scripts/provision_be2.sh"
  end

  config.vm.define :be3 do |be3|
    be3.vm.hostname = 'be3'
    be3.vm.network :private_network, ip: '192.168.33.217'
    be3.vm.provision :shell, path: "scripts/provision_be3.sh"
  end

  config.vm.define :fe1 do |fe1|
    fe1.vm.hostname = 'fe1.chef-demo.com'
    fe1.vm.network :private_network, ip: '192.168.33.218'
    fe1.vm.provision "shell", :inline => \
      'dpkg -s chef-server-core || dpkg -i /vagrant/chef-server-core*'
  end
end
