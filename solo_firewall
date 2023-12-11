#!/bin/bash
#set loopback rules
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
#HTTP and HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
#Splunk Web UI
iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8000 -j ACCEPT
#Splunk Management Port
iptables -A INPUT -p tcp --dport 8089 -j ACCEPT
#Allow incoming syslog traffic
iptables -A INPUT -p tcp --dport 9997 -j ACCEPT
iptables -A INPUT -p tcp --dport 9998 -j ACCEPT
iptables -A INPUT -p tcp --dport 601 -j ACCEPT
iptables -A INPUT -p udp --dport 514 -j ACCEPT
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP
