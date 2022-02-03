# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration standard version 2
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    #config.vm.box = "peru/ubuntu-20.04-desktop-amd64"
  
    #current folder will be shared in the vagrant VM
    config.vm.synced_folder ".", "/home/vagrant/shared"
  
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = 2
      vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
      vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
      vb.customize ['modifyvm', :id, '--vram', '128']
      vb.customize ['modifyvm', :id, '--vrde', 'off']
      #vb.customize ['modifyvm', :id, '--audiocontroller', 'hda']
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
      # Make the DNS calls be resolved on host
      #vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get -y upgrade
    SHELL
  
    config.vm.provision :shell, privileged: false, inline: <<-SHELL
      cd shared/core-release-8.0.0
      ./setup.sh
    SHELL
  
  end

  # vagrant ssh -- -vvv -X

  # After installing a package that provides xauth (xorg-xauth, xorg-x11-xauth or similar), vagrant ssh -- -X worked fine.

#    default: Successfully installed argcomplete-1.12.3 packaging-21.3 pipx-0.16.4 pyparsing-3.0.7 userpath-1.8.0
#    default: Success! Added /home/vagrant/.local/bin to the PATH environment variable.
    # default: 
    # default: Consider adding shell completions for pipx. Run 'pipx completions' for
    # default: instructions.
    # default: 
    # default: You will need to open a new terminal or re-login for the PATH changes to take
    # default: effect.
    # default: 
    # default: Otherwise pipx is ready to go! ✨ 🌟 ✨



### instalar esto:

# sudo apt-get install libtk-img

