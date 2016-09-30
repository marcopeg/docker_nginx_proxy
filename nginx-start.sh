#/bin/sh
sed -i "s/\$HOST_IP/${HOST_IP}/g" /etc/nginx/nginx.conf
nginx -g 'daemon off;'
