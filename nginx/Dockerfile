FROM nginx:latest

#RUN apt-get update && \
#	apt-get install inotify-tools -y

RUN apt-get update && apt-get install -yq procps curl gnupg && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -yq nodejs && \
	npm install onchange -g

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

ADD ./nginx.sh .
ADD ./reloadNginx.sh .

RUN chmod +x ./nginx.sh && chmod +x ./reloadNginx.sh

CMD ["/nginx.sh"]