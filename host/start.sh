#!/bin/bash
set -e
#sudo docker build -t kasanojo . && sudo docker run -t --rm -i --security-opt seccomp:unconfined  -p 8080:8080 -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent kasanojo /bin/bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
KASADIR=$DIR/../../kasa

if [-z "$GOPATH" ]; then
    echo "Error: Please set GOPATH"
    exit 1
fi
echo ===========================
echo Docker:  $DIR
echo Project: $KASADIR
echo ===========================

if [ -d $KASADIR ]; then
    sudo docker build -t kasanojo . && sudo docker run --rm -t -i \
	-p 8080:8080 \
	 --security-opt seccomp:unconfined \
        -v $KASADIR:/home/hello/kasa \
        -v $DIR/../scripts:/home/hello/scripts \
        -v $DIR/../scripts/env/bashrc:/home/hello/.bashrc:ro \
        -v ~/go:/home/hello/go \
        kasanojo /bin/bash $KASACMD
    exit 0
else
    echo Unable to find build directory, please checkout repo to $KASADIR
    exit 1
fi
