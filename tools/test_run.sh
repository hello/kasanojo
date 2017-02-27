#!/bin/bash
set -e
#sudo docker build -t kasanojo . && sudo docker run -t --rm -i -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
echo $DIR

sudo docker build -t kasanojo . && sudo docker run -t -i \
    -v  /home/jchen/Projects/kasa:/home/hello/kasa \
    -v $DIR/../scripts:/home/hello/scripts \
    -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
