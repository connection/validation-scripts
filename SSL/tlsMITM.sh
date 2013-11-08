#!/bin/bash

ban(){ 
echo "\$ sh tlsMITM.sh $1:$2"
echo "	**********************************************"
echo "	*  TLSv1 / SSLv3 Renegotiation MITM Checker  *"
echo "	*  Coded By: Luis "connection" Santana       *"
echo "	*            HackTalk Security               *"
echo "	**********************************************"
}
echo "R" |openssl s_client -connect $1:$2 -no_ign_eof |if grep "Secure Renegotiation IS NOT supported" ; then clear ;ban ; echo "[!] $1 Vulnerable To TLSv1/SSLv3 Renegotiation MITM"; else clear ; ban ; echo "[+] $1 Not Vulnerable To TLSv1/SSLv3 Renegotiation MITM" ;fi

