#!/bin/bash

# This script opens port 22 to incoming ssh connections

iptables -A INPUT -i enp0s8 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j DROP
iptables -A OUTPUT -o enp0s8 -p tcp --sport 22 -m state --state ESTABLISHED -j DROP
