FROM debian:stretch-slim

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/back.list && \
	apt-get update && \
	apt-get install python3 python3-pip -y && \
	apt-get install python-certbot-apache -t stretch-backports -y && \
	pip3 install certbot-dns-cloudflare && \
	certbot plugins

COPY certs.sh .

RUN chmod +x ./certs.sh

CMD /certs.sh