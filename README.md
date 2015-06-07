# tortxof/couchdb

## A docker container for couchdb.

This container is built from ubuntu:trusty using couchdb from ppa:couchdb/stable.

### Using the container.

Run the container.

    docker run -d --name couchdb tortxof/couchdb

Create a data container.

    docker create --name couchdb-data --volumes-from couchdb busybox

Replace with an updated container.

    docker pull tortxof/couchdb
    docker stop couchdb
    docker rm couchdb
    docker run -d --name couchdb --volumes-from couchdb-data tortxof/couchdb
