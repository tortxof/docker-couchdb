FROM ubuntu:trusty
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:couchdb/stable -y && \
    apt-get update && \
    apt-get install -y supervisor couchdb && \
    rm -rf /var/lib/apt/lists/*

RUN echo '[httpd]\nbind_address = 0.0.0.0' > /etc/couchdb/local.d/docker.ini

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /var/run/couchdb

RUN chmod 0770 /etc/couchdb && \
    chmod 0770 /var/lib/couchdb && \
    chmod 0770 /var/log/couchdb && \
    chmod 0770 /var/run/couchdb && \
    chown -R couchdb:couchdb /etc/couchdb && \
    chown -R couchdb:couchdb /var/lib/couchdb && \
    chown -R couchdb:couchdb /var/log/couchdb && \
    chown -R couchdb:couchdb /var/run/couchdb

VOLUME ["/etc/couchdb", "/var/lib/couchdb", "/var/log/couchdb", "/var/run/couchdb"]

EXPOSE 5984

CMD ["/usr/bin/supervisord"]
