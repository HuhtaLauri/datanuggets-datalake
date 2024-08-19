# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.ssh.forward_agent = true

  config.vm.define "server1" do |server1|
    server1.vm.provider "virtualbox" do |v|
      v.memory = 4092
      v.cpus = 2
    end
    server1.vm.box = "generic/ubuntu2204"
    server1.vm.hostname = "server1"
    server1.vm.network :private_network, ip: "192.168.56.4"
    server1.vm.box_check_update = true
    server1.vm.synced_folder "provision", "/provision"
    server1.vm.provision "shell", path: "provision/setup.sh"
    server1.vm.provision "shell", inline: <<-SHELL
      echo "192.168.56.4 server1" >> /etc/hosts
      echo "192.168.56.5 server2" >> /etc/hosts
      echo "192.168.56.6 server3" >> /etc/hosts
    SHELL
    server1.vm.network "forwarded_port", guest: 8443, host: 8443
    server1.vm.network "forwarded_port", guest: 9000, host: 9000
    server1.vm.disk :disk, name: "store", size: "10GB"

  end

  config.vm.define "server2" do |server2|
    server2.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    server2.vm.box = "generic/ubuntu2204"
    server2.vm.hostname = "server2"
    server2.vm.network :private_network, ip: "192.168.56.5"
    server2.vm.box_check_update = true
    server2.vm.synced_folder "provision", "/provision"
    server2.vm.provision "shell", path: "provision/setup.sh"
    server2.vm.provision "shell", inline: <<-SHELL
      echo "192.168.56.4 server1" >> /etc/hosts
      echo "192.168.56.5 server2" >> /etc/hosts
      echo "192.168.56.6 server3" >> /etc/hosts
    SHELL
    server2.vm.disk :disk, name: "store", size: "10GB"
    server2.vm.network "forwarded_port", guest: 80, host: 8888
  end

#  config.vm.define "server3" do |server3|
#    server3.vm.provider "virtualbox" do |v|
#      v.memory = 1024
#      v.cpus = 1
#    end
#    server3.vm.box = "generic/ubuntu2204"
#    server3.vm.hostname = "server3"
#    server3.vm.network :private_network, ip: "192.168.56.6"
#    server3.vm.box_check_update = true
#    server3.vm.synced_folder "provision", "/provision"
#    server3.vm.provision "shell", path: "provision/setup.sh"
#    server3.vm.provision "shell", inline: <<-SHELL
#      echo "192.168.56.4 server1" >> /etc/hosts
#      echo "192.168.56.5 server2" >> /etc/hosts
#      echo "192.168.56.6 server3" >> /etc/hosts
#    SHELL
#    server3.vm.disk :disk, name: "store", size: "10GB"
#
#  end

end
