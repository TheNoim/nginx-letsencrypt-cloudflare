#!/bin/bash
if [ ! -f /etc/letsencrypt/dnscloudflare.ini ]; then
    echo "/etc/letsencrypt/dnscloudflare.ini is missing"
    exit 1
fi
if [[ -z "${DOMAINS}" ]]; then
	echo "No domains to process"
	exit 0
fi
if [[ -z "${EMAIL}" ]]; then
	echo "No E-Mail Adress for domain given"
	exit 2
fi
if [[ -z "${AGREE_TOS}" ]]; then
	echo "You need to Agree to letsencrypts TOS. Set the env var AGREE_TOS to something."
	exit 3
fi

if [[ -z "${CERT_NAME}" ]]; then
	CERT_NAME="universal"
fi

chmod 600 /etc/letsencrypt/dnscloudflare.ini
domainargs=""
for i in $(echo $DOMAINS | sed "s/,/ /g")
do
    echo "$i"
    domainargs+="-d ${i} "
done
certcommand="certbot certonly --cert-name ${CERT_NAME} ${domainargs}--dns-cloudflare --server https://acme-v02.api.letsencrypt.org/directory -n --agree-tos --email ${EMAIL} --dns-cloudflare-credentials /etc/letsencrypt/dnscloudflare.ini"
while true
do 
    echo $certcommand
    /bin/bash -c "${certcommand}"
    sleep 86400
done