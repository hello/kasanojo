FROM  ubuntu:latest

MAINTAINER Jackson Chen <jchen@sayhello.com>

RUN apt-get update && apt-get install -y \
 fakeroot \
 mtd-utils \
 genext2fs \
 cramfsprogs \
 libxml2-dev \
 bc \
 kmod \
 cpio \
 gawk \
 libgtk2.0-0 \
 libsm6 \
 xz-utils \
 unzip \
 wget  \
 curl \
 vim \
 tmux \
 ssh \
 git \
 python \
 build-essential \
 libncurses-dev \
 autoconf \
 libtool \
 pkg-config \
 qemu \
 binfmt-support \
 qemu-user-static

#########################################################
# Set up Linux Toolchain && sdk
RUN mkdir /home/hello &&\
    mkdir /home/hello/toolchain
RUN wget "https://hello-firmware.s3.amazonaws.com/sati/toolchain/arm-elf-4.5.2.zip?Signature=0%2FteH1pyxIkdXQCQ6SPGzwwkFPo%3D&Expires=1550974714&AWSAccessKeyId=AKIAJIFAYC7K7Y2ELCBQ" -O /home/hello/toolchain/arm-elf.zip
RUN wget "https://hello-firmware.s3.amazonaws.com/sati/toolchain/linaro-armv7ahf-2015.11-gcc5.2-x86_64.tar.xz?Signature=VMyq8%2BfH4m5FNnyblGrAFqYIQOc%3D&Expires=1550974714&AWSAccessKeyId=AKIAJIFAYC7K7Y2ELCBQ" -O /home/hello/toolchain/gcc.tar.xz
RUN tar -xJf /home/hello/toolchain/gcc.tar.xz -C /usr/local/
RUN unzip /home/hello/toolchain/arm-elf.zip -d /home/hello/toolchain
RUN tar -xf /home/hello/toolchain/arm-elf-4.5.2/arm-elf-64.tar.bz2 -C /usr/local/

# Get go and build
RUN wget "https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz" -O /home/hello/toolchain/go.tar.gz
RUN cd /home/hello/toolchain && \
    tar -xzf go.tar.gz -C /home/hello && \
    cp -R /home/hello/go /home/hello/go1.8
ENV GOROOT_BOOTSTRAP /home/hello/go1.8
RUN cd /home/hello/go/src && ./make.bash
RUN rm -rf /home/hello/go1.8
RUN mv /home/hello/go /usr/lib/go
RUN mkdir /home/hello/go
ENV GOPATH /home/hello/go
ENV GOROOT /usr/lib/go

#########################################################
#  QoL
ENV HOME /home/hello
EXPOSE 8080
ENV PATH="/home/hello/scripts:/usr/lib/go/bin:${PATH}"

