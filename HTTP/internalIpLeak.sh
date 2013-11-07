#!/bin/bash
# Microsoft IIS Internal IP Leak Validator
# By Luis "connection" Santana
# HackTalk Security

if [ $# -ne 2 ]; then 
   echo Usage: $0 IP Port
   exit
fi
 
 
echo [*] sending Get request to $1 on port $2
printf "GET / HTTP/1.0\r\nCONNECTION: CLOSE\r\n\r\n" | nc $1 $2 | grep Content-Location:
echo [*] done
