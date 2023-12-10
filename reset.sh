#!/bin/bash
#this script simply resets the steps performed in splunk_init.sh
#it is only useful for resetting quickly to debug issues with splunk_init.sh

#remove any scripts that were brought down by splunk_init.sh 
rm firewall.sh repos.sh splunk_init.sh sudowoodo.sh

#flush the firewall rules that were set by splunk_init.sh
iptables -F

#remove packages that were installed with splunk_init.sh
yum -y remove epel-release
yum -y remove clamav
yum -y remove clamav-db

#check to make sure packages were uninstalled
yum list installed | grep epel-release
yum list installed | grep clamav
echo -e "\t RESET COMPLETE"
