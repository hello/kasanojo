#!/bin/sh
sudo docker build -t kasanojo . && sudo docker run -t --rm -i kasanojo bash
