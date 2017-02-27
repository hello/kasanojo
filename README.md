# kasanojo
傘工場 Docker for compiling https://github.com/hello/kasa

# instructions
1.run tools/start.sh, this will build the container required for the build env, and log you into the container if successful
2.run /home/hello/scripts/build*.sh to generate the binary

# directory layout
* host
    contains scripts used by the container host

* scripts
    contains scripts invoked inside the container, is mounted by the host
