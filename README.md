# tortxof/couchdb

## A docker container for couchdb.

This container is built from ubuntu:trusty using couchdb from ppa:couchdb/stable.

### Using the container.

Build the container

    docker build -t local/couchdb .

Run the container.

    docker run --name couchdb -d -P local/couchdb

### Using the container with a separate data container.

Create the data container.

    docker create -v /var/lib/couchdb --name couchdb-data ubuntu:trusty

Build the couchdb container as above.

    docker build -t local/couchdb .

Run the container.

    docker run --name couchdb -d -P --volumes-from couchdb-data local/couchdb
