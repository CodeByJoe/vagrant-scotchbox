# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Project specific settings
    config.vm.hostname = "your-local-hostname.vagrant"
    config.vm.network "private_network", ip: "192.168.100.101"

    # Lock version in case upgrade causes mismatch in bootstrap.sh
    config.vm.box = "scotch/box"
    config.vm.box_version = "1.5"
    config.vm.box_check_update = false
    config.vm.provision :shell, path: "Vagrantfile.sh"
    config.vm.provision :shell, path: "bootstrap.sh"

    # Must have at least 256M for MySQL tweaks in Vagrantfile.sh
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
    end

    # Use bindfs to mount for correct folder permissions
    config.vm.synced_folder ".", "/vagrant-nfs", type: :nfs
    config.bindfs.bind_folder "/vagrant-nfs", "/var/www"
end