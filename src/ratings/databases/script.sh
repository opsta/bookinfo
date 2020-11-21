#!/bin/sh

set -e
mongoimport --host localhost --db ratings \
  --collection ratings --drop --file /docker-entrypoint-initdb.d/ratings_data.json
