# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  end

  config.vm.define "attacker" do |attacker|
    attacker.vm.box = "ubuntu/jammy64"
    attacker.vm.hostname = "attacker"
    attacker.vm.network "private_network", ip: "192.168.56.10"

    attacker.vm.provider "virtualbox" do |vb|
      vb.name = "ecr-attacker"
      vb.memory = 3072
      vb.cpus = 2
    end

    attacker.vm.provision "shell", path: "provision/attacker.sh"
  end

  config.vm.define "dmz" do |dmz|
    dmz.vm.box = "ubuntu/jammy64"
    dmz.vm.hostname = "dmz"
    dmz.vm.network "private_network", ip: "192.168.56.20"

    dmz.vm.provider "virtualbox" do |vb|
      vb.name = "ecr-dmz"
      vb.memory = 4096
      vb.cpus = 2
    end

    dmz.vm.provision "shell", path: "provision/dmz.sh"
  end

  config.vm.define "monitor" do |monitor|
    monitor.vm.box = "ubuntu/jammy64"
    monitor.vm.hostname = "monitor"
    monitor.vm.network "private_network", ip: "192.168.56.30"

    monitor.vm.provider "virtualbox" do |vb|
      vb.name = "ecr-monitor"
      vb.memory = 4096
      vb.cpus = 2
    end

    monitor.vm.provision "shell", path: "provision/monitor.sh"
  end
end
