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
