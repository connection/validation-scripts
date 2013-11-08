#!/bin/bash

ban(){ 
echo "\$ sh tlsReneg.sh $1"
echo "	*****************************************"
echo "	*  TLSv1 / SSLv3 Renegotiation Checker  *"
echo "	*  Coded By: Luis "connection" Santana    *"
echo "	*            HackTalk Security          *"
echo "	*****************************************"
}
echo "R" |openssl s_client -connect $1 -no_ign_eof |if grep "Secure Renegotiation IS supported" ; then clear ;ban ; echo "[!] $1 Vulnerable To TLSv1/SSLv3 Forced Renegotiation"; else clear ; ban ; echo "[+] $1 Not Vulnerable To TLSv1/SSLv3 Forced Renegotiation" ;fi

