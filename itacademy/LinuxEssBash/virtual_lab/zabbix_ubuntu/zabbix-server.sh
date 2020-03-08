#!/bin/bash

wget https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.4-1+bionic_all.deb
dpkg -i zabbix-release_4.4-1+bionic_all.deb
apt-get update

# install database
apt-get -y install mariadb-server-10.1 mariadb-client-10.1
systemctl enable --now mariadb.service

apt-get -y install zabbix-server-mysql
apt-get -y install zabbix-frontend-php zabbix-apache-conf
apt-get -y install zabbix-agent

mysql -uroot <<EOF
create database zabbix character set utf8 collate utf8_bin;
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';
quit
EOF

zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -pzabbix zabbix
sed -i -e 's/# DBHost=localhost/DBHost=localhost/' /etc/zabbix/zabbix_server.conf
sed -i -e 's/# DBPassword=/DBPassword=zabbix/' /etc/zabbix/zabbix_server.conf

# httpd config
sed -i -e  's%# php_value date.timezone Europe/Riga%php_value date.timezone Europe/Minsk%' /etc/zabbix/apache.conf

systemctl enable --now zabbix-server.service
systemctl enable --now zabbix-agent.service
systemctl restart apache2.service
