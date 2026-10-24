FROM alpine:3.20
COPY httpd.conf /etc/httpd.conf
COPY run.sh /run.sh
RUN apk add --no-cache busybox-extras && chmod +x /run.sh
CMD ["/run.sh"]
