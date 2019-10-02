FROM haproxy:1.7
USER root
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg