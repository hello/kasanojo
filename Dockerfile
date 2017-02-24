FROM  ubuntu:latest

MAINTAINER Jackson Chen <jchen@sayhello.com>

# set up build packages
RUN apt update
# needed by amarella env script
RUN apt install -y fakeroot mtd-utils genext2fs cramfsprogs libxml2-dev

# set up local files
RUN mkdir /home/hello
ADD ./toolchain /home/hello/toolchain
RUN apt install -y xz-utils unzip
RUN tar -xvJf /home/hello/toolchain/linaro-armv7ahf-2015.11-gcc5.2-x86_64.tar.xz -C /usr/local/
RUN unzip /home/hello/toolchain/arm-elf-4.5.2.zip -d /usr/local/

# fluff
RUN apt install -y vim tmux 







