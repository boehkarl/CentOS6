#!/bin/bash
echo "Setting stuff up"
echo "Grabbing scripts"
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/repos_test" >> repos.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/firewall.sh" >> firewall.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/sudowoodo.sh" >> sudowoodo.sh
chmod 755 repos.sh firewall.sh sudowoodo.sh
./firewall.sh -s
service iptables save
echo "Progress!"
echo "Now for packages"
yum install -y -q epel-release clamav
yum list installed | grep clamav
yum list installed | grep epel-release
