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

