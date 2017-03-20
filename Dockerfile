FROM  ubuntu:latest

MAINTAINER Jackson Chen <jchen@sayhello.com>

# set up build packages
RUN apt-get update
# needed by amarella env script
RUN apt-get install -y fakeroot mtd-utils genext2fs cramfsprogs libxml2-dev bc kmod cpio gawk libgtk2.0-0 libsm6 \
                    xz-utils unzip wget curl \
                    vim tmux ssh git \
                    python build-essential libncurses-dev autoconf libtool

#########################################################
# Set up Linux Toolchain && sdk
RUN mkdir /home/hello &&\
    mkdir /home/hello/toolchain
RUN wget "https://hello-firmware.s3.amazonaws.com/sati/toolchain/arm-elf-4.5.2.zip?Signature=0%2FteH1pyxIkdXQCQ6SPGzwwkFPo%3D&Expires=1550974714&AWSAccessKeyId=AKIAJIFAYC7K7Y2ELCBQ" -O /home/hello/toolchain/arm-elf.zip
RUN wget "https://hello-firmware.s3.amazonaws.com/sati/toolchain/linaro-armv7ahf-2015.11-gcc5.2-x86_64.tar.xz?Signature=VMyq8%2BfH4m5FNnyblGrAFqYIQOc%3D&Expires=1550974714&AWSAccessKeyId=AKIAJIFAYC7K7Y2ELCBQ" -O /home/hello/toolchain/gcc.tar.xz
RUN tar -xJf /home/hello/toolchain/gcc.tar.xz -C /usr/local/
RUN unzip /home/hello/toolchain/arm-elf.zip -d /home/hello/toolchain
RUN tar -xf /home/hello/toolchain/arm-elf-4.5.2/arm-elf-64.tar.bz2 -C /usr/local/


#########################################################
#  QoL
ENV HOME /home/hello
ENV PATH="/home/hello/scripts:${PATH}"
RUN apt-get install vim

#########################################################
#  Emulation
RUN apt-get install -y qemu binfmt-support qemu-user-static
