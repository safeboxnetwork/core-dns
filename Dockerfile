FROM alpine:edge

RUN apk --no-cache add dnsmasq

EXPOSE 53/udp
EXPOSE 67/udp
EXPOSE 68/udp

RUN mkdir -p /etc/dnsmasq.d/config
COPY dns.conf /etc/dnsmasq.d/               && \
     dhcp-conf /etc/dnsmasq.d/              && \
     dhcp-reservations.conf /etc/dnsmasq.d/ && \
     hosts.local /etc/dnsmasq.d/ 	    && \

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
