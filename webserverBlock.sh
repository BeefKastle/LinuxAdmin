#!/bin/bash

# this script closes ports to block connection to a webserver
# running on port 8080

# redirect port 80 to 8080
iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080

# allow incoming HTTP
iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j DROP
iptables -A INPUT -i eth0 -p tcp --dport 8080 -m state --state NEW,ESTABLISHED -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 8080 -m state --state ESTABLISHED -j DROP
