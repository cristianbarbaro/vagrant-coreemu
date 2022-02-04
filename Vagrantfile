# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
  
    # carpeta compartida con el host
    config.vm.synced_folder "./shared", "/home/vagrant/shared"

    # ip acceso a la vm desde el host
    #config.vm.network "private_network", ip: "10.100.100.10"

    # acceso mediante una interfaz en modo bridge
    config.vm.network "public_network"

    # forwarding de puerto desde el puerto host al puerto de la vm:
    #config.vm.network "forwarded_port", guest: 80, host: 8080
    
    config.vm.hostname = "corevm"
  
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
      vb.name = "corevm"
      vb.cpus = 2
      # https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/vboxmanage-modifyvm.html
      vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
      vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
      vb.customize ['modifyvm', :id, '--vram', '128']
      vb.customize ['modifyvm', :id, '--vrde', 'off']
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      # la tercera NIC es para la topología interna 
      vb.customize ["modifyvm", :id, "--nic3", "intnet"]
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get -y upgrade
      apt-get -y install libtk-img wget net-tools resolvconf
      ln -s /usr/local/bin/vcmd /usr/sbin/vcmd
      curl -s https://deb.frrouting.org/frr/keys.asc | apt-key add -
      echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) frr-stable | sudo tee -a /etc/apt/sources.list.d/frr.list
      apt update
    SHELL
  
    config.vm.provision :shell, privileged: false, inline: <<-SHELL
      wget https://github.com/coreemu/core/archive/refs/tags/release-8.0.0.tar.gz
      tar -xf release-8.0.0.tar.gz && cd core-release-8.0.0
      ./setup.sh
      . ~/.profile
      inv install -o --no-ospf
      sudo apt-get -y install frr frr-pythontools
      sudo systemctl enable core-daemon
      sudo systemctl start core-daemon
      sudo systemctl enable frr.service
      sudo systemctl start frr.service
    SHELL
  
  end
