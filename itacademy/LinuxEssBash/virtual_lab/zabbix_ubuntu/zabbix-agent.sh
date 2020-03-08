#!/bin/bash

wget https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.4-1+bionic_all.deb
dpkg -i zabbix-release_4.4-1+bionic_all.deb
apt-get update
apt-get -y install zabbix-agent
systemctl enable --now zabbix-agent.service
