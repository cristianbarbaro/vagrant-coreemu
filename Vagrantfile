# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # carpeta compartida con el host
  config.vm.synced_folder "./shared", "/home/vagrant/shared"

  # ip acceso a la vm desde el host
  #config.vm.network "private_network", ip: "192.168.100.10"

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
    vb.customize ["modifyvm", :id, "--nic3", "intnet"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get -y upgrade
    apt-get -y install libtk-img wget net-tools resolvconf apache2 bridge-utils
    ln -s /usr/local/bin/vcmd /usr/sbin/vcmd
    echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf && sysctl -p
    
    ## Instalacion de FRR, actualmente instala FRR 8.1.0 pero no anda la distribucion de rutas BGP
    #curl -s https://deb.frrouting.org/frr/keys.asc | apt-key add -
    #echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) frr-stable | sudo tee -a /etc/apt/sources.list.d/frr.list
    #apt update
  SHELL

  ## Llevamos la clave publica del usuario a la VM
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"

  ## Copiamos archivos auxiliares 
  config.vm.provision "file", source: "./aux", destination: "$HOME/aux"

  config.vm.provision :shell, privileged: false, inline: <<-SHELL
    ## Copiamos la clave publica para poder hacer sshuttle
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
    
    ## Descargamos coreemu
    wget https://github.com/coreemu/core/archive/refs/tags/release-8.0.0.tar.gz
    tar -xf release-8.0.0.tar.gz && cd core-release-8.0.0
    
    ## Copiamos archivo que corrige bug de Core en interfaces RJ45 mencionado en el PR https://github.com/coreemu/core/pull/647
    cp /home/vagrant/aux/physical.py /home/vagrant/core-release-8.0.0/daemon/core/nodes/physical.py
    
    ## Instalamos coreemu
    ./setup.sh
    . ~/.profile
    
    ## Deshabilitamos Quagga porque usamos FRR
    inv install -o --no-ospf
    
    ## Instalamos frr
    sudo apt-get -y install frr frr-pythontools
    
    ## Habilitamos los los servicios de core
    sudo systemctl enable core-daemon
    sudo systemctl start core-daemon
    sudo systemctl enable frr.service
    sudo systemctl start frr.service
  SHELL

end
