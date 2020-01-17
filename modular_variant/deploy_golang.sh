#! /bin/bash -xe

db_volume=${1:-'/tmp/mongodb'}

mkdir $db_volume || true
docker run -d --name mongo-server -v $db_volume:/data/db -p 27017-27019:27017-27019  mongo:latest
docker exec mongo-server sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf.orig
docker restart mongo-server

MONGO_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' mongo-server)
echo $MONGO_IP

docker build -t me:goapp .
docker run -it -d --name app -e mongo_url="$MONGO_IP:27017" -p 8080:8080 me:goapp
