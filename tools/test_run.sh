#!/bin/sh
#sudo docker build -t kasanojo . && sudo docker run -t --rm -i -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
sudo docker build -t kasanojo . && sudo docker run -t -i -v  /home/jchen/Projects/kasa:/home/hello/kasa -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
