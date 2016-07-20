FROM ubuntu:latest
MAINTAINER Pablo Torres

ENV VERSION 3.4.9-1

# COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
	wget \
	mysql-client \
    netcat \
#    supervisor \
	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

### PDNS ###
RUN cd /tmp && wget https://downloads.powerdns.com/releases/deb/pdns-static_${VERSION}_amd64.deb && dpkg -i pdns-static_${VERSION}_amd64.deb && rm pdns-static_${VERSION}_amd64.deb
RUN useradd --system pdns

COPY powerdns/pdns.conf /etc/powerdns/pdns.conf
COPY powerdns/pdns.d/ /etc/powerdns/pdns.d/

### SUPERVISOR ###
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start.sh /start.sh
COPY hosting_panel.sql /hosting_panel.sql

#EXPOSE 53
#EXPOSE 53/udp

CMD ["/bin/bash", "/start.sh"]
