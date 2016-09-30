FROM nginx:latest
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./nginx-start.sh /nginx-start.sh
EXPOSE 80
CMD ["/bin/sh", "/nginx-start.sh"]
