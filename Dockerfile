FROM ubuntu:trusty
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y software-properties-common
RUN add-apt-repository ppa:couchdb/stable -y
RUN apt-get update -y
RUN apt-get install -yV couchdb
RUN echo '[httpd]\nbind_address = 0.0.0.0' > /etc/couchdb/local.d/docker.ini
RUN mkdir /var/run/couchdb

EXPOSE 5984
CMD couchdb
