#!/bin/sh
# Delete all stopped containers
sudo docker rm $( docker ps -q -f status=exited)
# Delete all dangling (unused) images
sudo docker rmi $( docker images -q -f dangling=true)
sudo docker images
