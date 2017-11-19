#!/bin/bash - 
#===============================================================================
#
#          FILE: keystone-service-create.sh
# 
#         USAGE: ./keystone-service-create.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 11/15/2017 22:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
public_ip=controller
source ~/local-openrc.sh
#openstack service create --name keystone  --description "OpenStack Identity" keystone
docker exec -ti `docker ps -f ancestor=keystone:ubuntu -n1 -q` /var/lib/openstack/bin/keystone-manage bootstrap --bootstrap-password passw0rd --bootstrap-public-url http://controller:5000/v3/ --bootstrap-region-id RegionOne

openstack project create --domain default  --description "Service Project" service
openstack user create --domain default --password passw0rd glance
openstack role add --project service --user glance admin
openstack service create --name glance  --description "OpenStack Image" image
openstack endpoint create --region RegionOne  image public http://${public_ip}:9292
openstack endpoint create --region RegionOne  image internal http://glance-api:9292
openstack endpoint create --region RegionOne  image admin http://glance-api:9292

openstack user create --domain default --password passw0rd cinder
openstack role add --project service --user cinder admin
openstack service create --name cinder  --description "Volume" volume
openstack endpoint create --region RegionOne  volume public "http://${public_ip}:8776/v1/%(tenant_id)s"
openstack endpoint create --region RegionOne  volume internal "http://cinder-api:8776/v1/%(tenant_id)s"
openstack endpoint create --region RegionOne  volume admin "http://cinder-api:8776/v1/%(tenant_id)s"

openstack service create --name cinder  --description "VolumeV2" volumev2
openstack endpoint create --region RegionOne  volumev2 public "http://${public_ip}:8776/v2/%(tenant_id)s"
openstack endpoint create --region RegionOne  volumev2 internal "http://cinder-api:8776/v2/%(tenant_id)s"
openstack endpoint create --region RegionOne  volumev2 admin "http://cinder-api:8776/v2/%(tenant_id)s"

openstack service create --name cinder  --description "VolumeV3" volumev3
openstack endpoint create --region RegionOne  volumev3 public "http://${public_ip}:8776/v3/%(tenant_id)s"
openstack endpoint create --region RegionOne  volumev3 internal "http://cinder-api:8776/v3/%(tenant_id)s"
openstack endpoint create --region RegionOne  volumev3 admin "http://cinder-api:8776/v3/%(tenant_id)s"

openstack user create --domain default --password passw0rd neutron
openstack role add --project service --user neutron admin
openstack service create --name neutron  --description "Networking" network
openstack endpoint create --region RegionOne  network public "http://${public_ip}:9696"
openstack endpoint create --region RegionOne  network internal "http://neutron-server:9696"
openstack endpoint create --region RegionOne  network admin "http://neutron-server:9696"
