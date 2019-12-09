#!/bin/bash

# this script opens ports so a mysql databse can be accessed from the connected
# network

iptables -A INPUT -i enp0s8 -p tcp -s 192.168.56.0/24 --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o enp0s8 -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT
