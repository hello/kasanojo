#!/bin/bash
set -e
#sudo docker build -t kasanojo . && sudo docker run -t --rm -i -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
KASADIR=$DIR/../../kasa

echo ===========================
echo Docker:  $DIR
echo Project: $KASADIR
echo ===========================

if [ -d $KASADIR ]; then
    sudo docker build -t kasanojo . && sudo docker run -t -i \
        -v $KASADIR:/home/hello/kasa \
        -v $DIR/../scripts:/home/hello/scripts:ro \
        -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
    exit 0
else
    echo Unable to find build directory, please checkout repo to $KASADIR
    exit 1
fi
