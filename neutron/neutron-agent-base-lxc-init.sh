#!/bin/bash

#create base image
lxc launch ubuntu:x neutron-agent-base

lxc exec neutron-agent-base -- bash <<EOF
dhclient eth0
cat <<EOT > /etc/apt/sources.list
deb http://mirrors.ustc.edu.cn/ubuntu xenial main universe
deb http://mirrors.ustc.edu.cn/ubuntu xenial-updates main universe
deb http://mirrors.ustc.edu.cn/ubuntu xenial-security main universe
EOT
apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


apt-get update

apt-get install -y --force-yes docker-ce
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
EOF

lxc stop neutron-agent-base
lxc publish neutron-agent-base --alias neutron-agent-base
if [[ $? -eq 0 ]];then
  lxc delete neutron-agent-lxc-base
fi

#create lxc profile for neutron-agent system container
lxc profile create neutron-agent
cat << EOF | lxc profile edit neutron-agent
config:
  linux.kernel_modules: bridge,br_netfilter,ip_tables,ip6_tables,ip_vs,netlink_diag,nf_nat,overlay,xt_conntrack
  raw.lxc: |-
    lxc.aa_profile = unconfined
    lxc.cgroup.devices.allow = a
    lxc.mount.auto=proc:rw sys:rw
    lxc.cap.drop =
  security.nesting: "true"
  security.privileged: "true"
  boot.autostart: "1"
description: ""
devices:
  eth0:
    name: eth0
    nictype: bridged
    parent: lxdbr0
    type: nic
  eth1:
    name: eth1
    nictype: bridged
    parent: br-vxlan
    type: nic
  eth11:
    name: eth11
    nictype: bridged
    parent: br-vlan
    type: nic
  eth12:
    name: eth12
    nictype: bridged
    parent: br-vlan
    type: nic
EOF

