#!/bin/bash
echo "Setting stuff up"
echo "Grabbing scripts"

#These might be pulled from someone over the network
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/repos.sh" >> repos.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/firewall.sh" >> firewall.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/sudowoodo.sh" >> sudowoodo.sh
chmod 755 repos.sh firewall.sh sudowoodo.sh

#If it is possible to pull splunk_init immediately before changing repos
#uncomment the following lines
./repos.sh
yum update -y

#Deploying Firewall
./firewall.sh -s 2>/dev/null
service iptables save

echo "Progress!"
echo "Now for packages"
yum install -y -q epel-release
yum install -y -q clamav
yum install -y firefox
yum install -y ntp

yum list installed | grep -E 'epel-release|clamav|firefox|ntp'

#Edit rsyslog to allow incoming traffic on ports TCP/UDP 514
#UDP
sed -i 's/^#$ModLoad imudp/$ModLoad imudp/' /etc/rsyslog.conf
sed -i 's/^#$UDPServerRun/$UDPServerRun/' /etc/rsyslog.conf
#TCP
sed -i 's/^#$ModLoad imtcp/$ModLoad imtcp/' /etc/rsyslog.conf
sed -i 's/^#$InputTCPServerRun/$InputTCPServerRun/' /etc/rsyslog.conf
#Append this to the bottom of rsyslog.conf
echo "$template RemoteLogs, \"var/log/%HOSTNAME%/%PROGRAMNAME%.log\"" >> /etc/rsyslog.conf
echo "*.* ?RemoteLogs" >> /etc/rsyslog.conf
echo "& ~" >> /etc/rsyslog.conf


echo "Now for Gnome!"
yum groupinstall -y 'X Window System'
yum groupinstall -y 'Desktop'
sed -i 's/^id:3:/id:5:/' /etc/inittab
yum groupinstall -y fonts
reboot -f
