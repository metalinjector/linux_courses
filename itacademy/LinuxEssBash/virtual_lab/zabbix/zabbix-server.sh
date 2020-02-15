#!/bin/bash
uptime 
rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/8/x86_64/zabbix-release-4.4-1.el8.noarch.rpm
#rpm -Uvh https://repo.zabbix.com/zabbix/4.5/rhel/8/x86_64/zabbix-release-4.5-1.el8.noarch.rpm

yum -y install http://mirror.centos.org/centos/8.0.1905/AppStream/x86_64/os/Packages/libssh2-1.8.0-8.module_el8.0.0+189+f9babebb.1.x86_64.rpm 
yum -y install zabbix-server-mysql
yum -y install zabbix-web-mysql zabbix-apache-conf

# agent
yum -y install zabbix-agent

yum -y install mariadb-server mariadb
systemctl enable --now mariadb.service


mysql -uroot <<EOF
create database zabbix character set utf8 collate utf8_bin;
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';
quit
EOF

zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -pzabbix zabbix
sed -i -e 's/# DBHost=localhost/DBHost=localhost/' /etc/zabbix/zabbix_server.conf
sed -i -e 's/# DBPassword=/DBPassword=zabbix/' /etc/zabbix/zabbix_server.conf

# httpd config
sed -i -e  's%; php_value\[date.timezone\] = Europe/Riga%php_value[date.timezone] = Europe/Minsk%' /etc/php-fpm.d/zabbix.conf

setenforce 0
systemctl enable --now zabbix-server.service
systemctl enable --now httpd

systemctl enable --now zabbix-agent.service


