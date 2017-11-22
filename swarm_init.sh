#!/bin/bash - 
#===============================================================================
#
#          FILE: swarm_init.sh
# 
#         USAGE: ./swarm_init.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 11/16/2017 22:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
docker network create -d overlay mgmt  --attachable
#docker network create -d bridge --scope swarm --subnet 172.29.240.0/22 --ip-range 172.29.241.0/24 --internal -o com.docker.network.bridge.name=br-vxlan br-vxlan
#docker network create -d bridge --scope swarm  -o com.docker.network.bridge.name=br-vlan --internal br-vlan
#docker volume create rabbitmq_vol
#docker volume create mariadb_vol

