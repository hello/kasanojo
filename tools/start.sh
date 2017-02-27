#!/bin/bash
set -e
#sudo docker build -t kasanojo . && sudo docker run -t --rm -i -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash
DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
KASADIR=$DIR/../../kasa
EXT_ARGS="cd /home/hello"

if [ $# -eq 0 ]
then
    echo "No arguments supplied"
else
    EXT_ARGS+=" && ./$1"

fi
echo ===========================
echo Tools:   $DIR
echo Project: $KASADIR
echo Args:    $EXT_ARGS
echo ===========================
if [ -d $KASADIR ]; then
    sudo docker build -t kasanojo . && sudo docker run --rm -t -i \
        -v $KASADIR:/home/hello/kasa \
        -v $DIR/../scripts:/home/hello/scripts:ro \
        -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash -c "$EXT_ARGS"
    exit 0
else
    echo Unable to find build directory, please checkout repo to $KASADIR
    exit 1
fi
