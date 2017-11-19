#!/bin/bash 

VXLAN_IP=172.29.240.13
NODE_NAME=network-3
NEUTRON_IMAGE=yanyao/neutron:master




lxc launch neutron-agent-base ${NODE_NAME} --profile neutron-agent

lxc exec ${NODE_NAME} -- bash <<EOF
#!/bin/bash -x
cat <<EOS > /etc/network/interfaces

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
auto eth1
iface eth1 inet static
address $VXLAN_IP
netmask 255.255.252.0
EOS

ifdown  -a && ifup -a
sleep 20

docker pull ${NEUTRON_IMAGE}
docker tag ${NEUTRON_IMAGE} neutron:master

EOF

lxc file push neutron-agent-compose.yml ${NODE_NAME}/root/

lxc exec ${NODE_NAME} -- bash <<EOF
docker-compose -f /root/neutron-agent-compose.yml up -d
EOF
