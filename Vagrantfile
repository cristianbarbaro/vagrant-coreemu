# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration standard version 2
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
  
    #current folder will be shared in the vagrant VM
    config.vm.synced_folder "./shared", "/home/vagrant/shared"

    # vm in host LAN (bridge interface)
    #config.vm.network "public_network"
    
    config.vm.hostname = "corevm"
  
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
      vb.name = "corevm"
      vb.cpus = 2
      vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
      vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
      vb.customize ['modifyvm', :id, '--vram', '128']
      vb.customize ['modifyvm', :id, '--vrde', 'off']
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      vb.customize ["modifyvm", :id, "--nic2", "intnet"]
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get -y upgrade
      apt-get -y install libtk-img wget net-tools
    SHELL
  
    config.vm.provision :shell, privileged: false, inline: <<-SHELL
      wget https://github.com/coreemu/core/archive/refs/tags/release-8.0.0.tar.gz
      tar -xf release-8.0.0.tar.gz && cd core-release-8.0.0
      ./setup.sh
    SHELL
  
  end
