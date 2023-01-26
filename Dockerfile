FROM alpine:edge

RUN apk --no-cache add dnsmasq

EXPOSE 53/udp
EXPOSE 67/udp
EXPOSE 68/udp

RUN  mkdir /etc/dnsmasq.d/config 

COPY *.conf /etc/dnsmasq.d/
COPY hosts.local /etc/dnsmasq.d/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
