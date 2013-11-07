#!/bin/bash

echo
echo "	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "	|     SNMP Open Port Scanner      |"
echo "	|  By Luis \"connection\" Santana   |"
echo "	|        HackTalk Security        |"
echo "	-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

# Make sure we got enough arguments
if [ $# -ne 1 ]; then
   echo Usage: $0 IP
   exit
fi

# TCP
echo "Open TCP Ports"
echo "------------------------"
snmpwalk -cpublic $1 1.3.6.1.2.1.6.13.1.1 | while read i; do echo "[TCP] Port `echo $i |cut -d '.' -f 6` open"; done

echo

# UDP
echo "Open UDP Ports"
echo "------------------------"
snmpwalk -cpublic $1 1.3.6.1.2.1.7.5.1.1 | while read i; do echo "[UDP] Port `echo $i |cut -d '.' -f 6|cut -d ' ' -f 1` open"; done
