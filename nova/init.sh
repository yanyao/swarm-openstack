#!/bin/bash

PROC=$1

FLAG=0
for svc in api-os-compute scheduler compute placement conductor api-metadata spicehtml5proxy novncproxy consoleauth;do
   if [[ $PROC == "$svc" ]];then
      FLAG=1
      break
   fi
done


if [[ $FLAG -eq 0 ]];then
    exit 12
fi

INIT_DB=${INIT_DB:-false}


if [ "$INIT_DB" = "true" ]; then
 /bin/sh -c    "nova-manage api_db version" nova
 /bin/sh -c    "nova-manage cell_v2 map_cell0" nova
 /bin/sh -c    "nova-manage cell_v2 create_cell --name cell1" nova
 /bin/sh -c    "nova-manage api_db sync" nova
 /bin/sh -c    "nova-manage db sync" nova

fi






case "$PROC" in 
  api-os-compute)
     uwsgi --ini /etc/uwsgi/nova-api-os-compute.ini
     ;;
  api-metadata)
     uwsgi --ini /etc/uwsgi/nova-api-metadata.ini
     ;;
  placement)
     uwsgi --ini /etc/uwsgi/nova-placement-api.ini
    ;;
  *)
     /bin/sh -c "nova-$PROC" nova
    ;;
esac
