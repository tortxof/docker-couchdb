FROM ubuntu:trusty
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:couchdb/stable -y && \
    apt-get update && \
    apt-get install -yV couchdb

RUN echo '[httpd]\nbind_address = 0.0.0.0' > /etc/couchdb/local.d/docker.ini

VOLUME ["/etc/couchdb", "/var/lib/couchdb", "/var/log/couchdb", "/var/run/couchdb"]

EXPOSE 5984

CMD couchdb
