#!/bin/bash

# this script opens ports to allow incoming pop3 connections

iptables -A INPUT -i enp0s3 -p tcp --dport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o enp0s3 -p tcp --sport 110 -m state --state ESTABLISHED -j ACCEPT
