#!/bin/bash

# this script closes ports so the mysql database cannot be accessed

iptables -A INPUT -i enp0s8 -p tcp -s 192.168.56.0/24 --dport 3306 -m state --state NEW,ESTABLISHED -j DROP
iptables -A OUTPUT -o enp0s8 -p tcp --sport 3306 -m state --state ESTABLISHED -j DROP
