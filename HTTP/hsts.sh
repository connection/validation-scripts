cat <<END

	****************************
	*       HSTS Checker       *
	*                          *
	*   Coded by:              *
	*            Luis Santana  *
	****************************
END

if [ $# -ne 1 ]; then
	echo Usage: $0 IP/Host
	echo Note: no https:// is required
	exit
fi

curl -skD - https://$1 |if grep "Strict-"; then echo "[+] HSTS Enabled For $1\n"; else echo "[!] HSTS Not Enabled For $1\n"; fi
