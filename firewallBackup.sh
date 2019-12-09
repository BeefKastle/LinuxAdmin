#!/bin/bash

# This script saves the current iptables
# firewall configuration to a file so it can be restored.

iptables-save > savedrules.txt
