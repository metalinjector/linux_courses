#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
yum install -y mod_wsgi python3 python3-flask.noarch

setenforce 0
useradd user1
groupadd group1
# apache configuration
cp ${script_dir}/wsgi_example.conf /etc/httpd/conf.d/
systemctl enable --now httpd.service
${script_dir}/test.sh
