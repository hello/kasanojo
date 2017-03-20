# Kasanojo
傘工場 -- Umbrella Factory.
Docker for compiling https://github.com/hello/kasa

# Requirements
*  Ubuntu host, other linux distro will work in theory but not tested.
*  [docker](https://docs.docker.com/engine/installation/linux/ubuntu/)
```
#simplified install(no key check)
$ sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
$ sudo apt-get update
$ sudo apt-get -y install docker-engine
```
*  kasa repo checked out as following
```
+-- parent
|   +-- kasa
|   +-- kasanojo (this)
```
       
# instructions
1.  run host/start.sh, this will build the container required for the build env, and log you into the container if successful
2.  run /home/hello/scripts/build*.sh inside the container to build kasa

# directory layout
```
+-- kasanojo
|   +-- Dockerfile      : image builder
|   +-- host/*          : scripts to be called by the host
|   +-- scripts/*       : scripts mounted inside the container, invoked within.
```
