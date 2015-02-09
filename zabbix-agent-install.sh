#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo ':: Download deb'
wget http://repo.zabbix.com/zabbix/2.4/debian/pool/main/z/zabbix-release/zabbix-release_2.4-1+wheezy_all.deb

echo ':: Add deb'
dpkg -i zabbix-release_2.4-1+wheezy_all.deb

echo ':: Updating lists'
apt-get update

echo ':: Installing package'
apt-get install -y zabbix-agent
