#!/bin/bash

# this script allows various rules in the firewall. 

# allow pings
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

# allow connections from other server
iptables -A INPUT -s 192.168.56.20 j ACCEPT
