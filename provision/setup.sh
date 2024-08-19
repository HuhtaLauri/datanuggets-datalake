#!/bin/bash

sudo apt update -y
sudo apt -y upgrade

sudo apt install apache2

# docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu jelly stable"
apt-cache policy docker-ce
sudo apt install docker-ce

sudo systemctl start docker

sudo groupadd -f docker
sudo usermod -aG docker vagrant
newgrp docker
# end docker

sudo sed -i "s/\#PermitRootLogin\ prohibit\-password/PermitRootLogin\ yes/" /etc/ssh/sshd_config
sudo systemctl restart ssh

# Ceph
sudo apt install -y lvm2
CEPH_RELEASE=18.2.2
curl --silent --remote-name --location https://download.ceph.com/rpm-${CEPH_RELEASE}/el9/noarch/cephadm
chmod +x cephadm
cp cephadm /usr/sbin/

sudo sgdisk --zap-all /dev/sdb
sudo wipefs --all /dev/sdb

cephadm install
cephadm install ceph-common

# end Ceph
