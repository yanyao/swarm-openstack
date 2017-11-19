#!/bin/bash - 
#===============================================================================
#
#          FILE: ceph_auth_create.sh
# 
#         USAGE: ./ceph_auth_create.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 11/16/2017 12:51
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

for i in images volumes vms backups ;do ceph osd pool create $i 128 128; ceph osd pool set $i size 1 ;done

ceph auth get-or-create client.openstack  osd 'allow class-read object_prefix rbd_children, allow rwx pool=images, allow rwx pool=vms, allow rwx pool=volumes, allow rwx pool=backups' mon 'allow r'


