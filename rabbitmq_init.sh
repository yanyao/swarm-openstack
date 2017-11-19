rabbitmqctl add_vhost /keystone
rabbitmqctl add_user keystone passw0rd
rabbitmqctl set_permissions -p /keystone keystone ".*" ".*" ".*"

rabbitmqctl add_vhost /glance
rabbitmqctl add_user glance passw0rd
rabbitmqctl set_permissions -p /glance glance ".*" ".*" ".*"

rabbitmqctl add_vhost /cinder
rabbitmqctl add_user cinder passw0rd
rabbitmqctl set_permissions -p /cinder cinder ".*" ".*" ".*"

rabbitmqctl add_vhost /neutron
rabbitmqctl add_user neutron passw0rd
rabbitmqctl set_permissions -p /neutron neutron ".*" ".*" ".*"

rabbitmqctl add_vhost /nova
rabbitmqctl add_user nova passw0rd
rabbitmqctl set_permissions -p /nova nova ".*" ".*" ".*"
