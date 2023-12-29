#!/bin/bash
echo "Setting stuff up"
echo "Grabbing scripts"

#Hopefully, a team member can pull this script down immediately and you can pull it over with SCP in the first minutes.
#Otherwise, you will need to manually change the repos and run yum update -y before pulling this script over with
#curl. There is an SSL error for pulling from github on the version of curl that comes on CentOS6.4.

curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/repos.sh" >> repos.sh
curl "https://raw.githubusercontent.com/boehkarl/CentOS6/main/pokedex.sh" >> pokedex.sh
chmod 755 repos.sh pokedex.sh

./repos.sh
yum update -y


#Deploying Firewall
./pokedex.sh -c 2>/dev/null
service iptables save

echo "Now for packages"
yum install -y -q epel-release
yum install -y -q clamav
yum install -y firefox
yum install -y wget

yum list installed | grep -E 'epel-release|clamav|firefox|wget' 2>/dev/null

#Edit rsyslog to allow incoming traffic on ports TCP/UDP 514
#UDP
sed -i 's/^#$ModLoad imudp/$ModLoad imudp/' /etc/rsyslog.conf
sed -i 's/^#$UDPServerRun/$UDPServerRun/' /etc/rsyslog.conf
#TCP
sed -i 's/^#$ModLoad imtcp/$ModLoad imtcp/' /etc/rsyslog.conf
sed -i 's/^#$InputTCPServerRun 514/$InputTCPServerRun 601/' /etc/rsyslog.conf
#Append this to the bottom of rsyslog.conf
echo "\$template RemoteLogs, \"var/log/%HOSTNAME%/%PROGRAMNAME%.log\"" >> /etc/rsyslog.conf
echo "*.* ?RemoteLogs" >> /etc/rsyslog.conf
echo "& ~" >> /etc/rsyslog.conf


echo "Now for Gnome!"
yum groupinstall -y 'X Window System'
yum groupinstall -y 'Desktop'
sed -i 's/^id:3:/id:5:/' /etc/inittab
yum groupinstall -y fonts

reboot -f
