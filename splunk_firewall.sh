# --sport == sourceport --dport == destinationport
# Drop all input and forward
iptables -P INPUT DROP
iptables -P FORWARD DROP

# ensure loopback is good 
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# HTTP & HTTPS rules 
iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Splunk WebGUI rules 
iptables -A INPUT -p tcp --dport 8000 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8000 -m state --state ESTABLISHED -j ACCEPT

# Splunk Management Port
iptables -A INPUT -p tcp --dport 8089 -m state --state NEW,ESTABLISHED -j ACCEPT

# Syslog traffic
iptables -A INPUT -p tcp --dport 9997 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 9998 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 601 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp --dport 514 -m state --state NEW,ESTABLISHED -j ACCEPT

# Kill SSH traffic
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j DROP
iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j DROP

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
