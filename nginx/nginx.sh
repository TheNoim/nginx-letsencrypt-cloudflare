#!/bin/bash
nginx

monitor() {
onchange $1 -v --delay 2500 -- /bin/bash -c "/reloadNginx.sh" && echo "Reloaded nginx"
}


monitor /etc/letsencrypt/live/ &
monitor /etc/nginx/conf.d/  