#!/bin/bash
sleep 1
if [ -e /var/run/nginx.pid ]; then
	nginx -s reload
else
	nginx
fi