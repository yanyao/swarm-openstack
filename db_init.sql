CREATE DATABASE  IF NOT EXISTS keystone;

GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' \
IDENTIFIED BY 'passw0rd';

CREATE DATABASE  IF NOT EXISTS glance;
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' \
IDENTIFIED BY 'passw0rd';

CREATE DATABASE  IF NOT EXISTS cinder;
GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'%' \
IDENTIFIED BY 'passw0rd';

CREATE DATABASE  IF NOT EXISTS neutron;
GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' \
IDENTIFIED BY 'passw0rd';


CREATE DATABASE  IF NOT EXISTS nova_api;
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova_api'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova_api'@'%' \
IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'%' \
IDENTIFIED BY 'passw0rd';

CREATE DATABASE  IF NOT EXISTS nova;
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' \
IDENTIFIED BY 'passw0rd';

CREATE DATABASE  IF NOT EXISTS nova_cell0;
GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'%' \
IDENTIFIED BY 'passw0rd';

CREATE DATABASE  IF NOT EXISTS nova_placement;
GRANT ALL PRIVILEGES ON nova_placement.* TO 'nova_placement'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON nova_placement.* TO 'nova_placement'@'%' \
IDENTIFIED BY 'passw0rd';


CREATE DATABASE  IF NOT EXISTS horizon;
GRANT ALL PRIVILEGES ON horizon.* TO 'horizon'@'localhost' \
  IDENTIFIED BY 'passw0rd';
GRANT ALL PRIVILEGES ON horizon.* TO 'horizon'@'%' \
IDENTIFIED BY 'passw0rd';
