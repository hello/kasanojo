#!/bin/sh
# Delete all stopped containers
sudo docker rm $(sudo docker ps -q -f status=exited)
# Delete all dangling (unused) images
sudo docker rmi $(sudo docker images -q -f dangling=true)
sudo docker images
