yum install nfs-utils rpcbind -y
setenforce 0
systemctl enable --now nfs-server
