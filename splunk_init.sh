#!/bin/bash
echo "Setting stuff up"
echo "Grabbing scripts"
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/repos.sh" >> repos.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/firewall.sh" >> firewall.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/sudowoodo.sh" >> sudowoodo.sh
chmod 755 repos.sh firewall.sh sudowoodo.sh
echo "Progress!"
echo "Now for packages"
yum install -y -q epel-release
yum install -y -q clamav
yum list installed | grep epel-release
yum list installed | grep clamav
./firewall.sh -s
service iptables save
echo "Now for Gnome!"
yum groupinstall -y 'X Window System'
yum groupinstall -y 'Desktop'
sed -i 's/^id:3:/id:5:/' /etc/inittab
yum groupinstall -y fonts
startx
