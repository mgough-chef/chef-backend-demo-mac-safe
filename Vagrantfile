# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/ubuntu-16.04'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = '1500'
    vb.cpus = 2
  end

  config.vm.define :be1 do |be1|
    be1.vm.hostname = 'be1'
    be1.vm.network :private_network, ip: '192.168.56.215'
    be1.vm.provision :shell, path: "scripts/provision_be_leader.sh"
  end

  config.vm.define :be2 do |be2|
    be2.vm.hostname = 'be2'
    be2.vm.network :private_network, ip: '192.168.56.216'
    be2.vm.provision :shell, path: "scripts/provision_be_follower.sh"
  end

  config.vm.define :be3 do |be3|
    be3.vm.hostname = 'be3'
    be3.vm.network :private_network, ip: '192.168.56.217'
    be3.vm.provision :shell, path: "scripts/provision_be_follower.sh"
  end

  config.vm.define :fe1 do |fe1|
    fe1.vm.hostname = 'fe1.chef-demo.com'
    fe1.vm.network :private_network, ip: '192.168.56.218'
    fe1.vm.provision :shell, path: "scripts/provision_fe1.sh"
    fe1.vm.provider "virtualbox" do |vb|
      vb.memory = '1500'
      vb.cpus = 2
    end
  end
end
