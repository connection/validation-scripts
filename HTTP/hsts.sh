cat <<END

	****************************
	*       HSTS Checker       *
	*                          *
	*   Coded by:              *
	*            Luis Santana  *
	****************************
END
curl -skD - https://$1 |if grep "Strict-"; then echo "[+] HSTS Enabled For $1\n"; else echo "[!] HSTS Not Enabled For $1\n"; fi
