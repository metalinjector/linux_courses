#!/bin/bash
rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/8/x86_64/zabbix-release-4.4-1.el8.noarch.rpm
yum -y install zabbix-agent
systemctl enable --now zabbix-agent.service
