virsh secret-define --file libvirt_ceph_secret.xml
virsh secret-set-value --secret 8d90f98b-918e-4565-a562-a2d14ae426c2 --base64 $(cat ceph/ceph.client.openstack.keyring |grep key|awk '{print $3}')
