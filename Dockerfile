FROM ubuntu:focal

# set environment variables for tzdata
ARG TZ=America/New_York
ENV TZ=${TZ}

# include manual pages and documentation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
  yes | unminimize

# install GCC-related packages
RUN apt-get -y install\
 binutils-doc\
 cpp-doc\
 gcc-doc\
 g++\
 g++-multilib\
 gdb\
 gdb-doc\
 glibc-doc\
 libblas-dev\
 liblapack-dev\
 liblapack-doc\
 libstdc++-10-doc\
 make\
 make-doc

# install clang-related packages
RUN apt-get -y install\
 clang\
 clang-10-doc\
 lldb

# install programs used for system exploration
RUN apt-get -y install\
 blktrace\
 linux-tools-generic\
 strace\
 tcpdump

# install interactive programs (emacs, vim, nano, man, sudo, etc.)
RUN apt-get -y install\
 bc\
 curl\
 dc\
 git\
 git-doc\
 man\
 psmisc\
 sudo\
 vim\
 wget

# set up libraries
RUN apt-get -y install\
 libreadline-dev\
 locales\
 wamerican

# install programs used for networking
RUN apt-get -y install\
 dnsutils\
 inetutils-ping\
 iproute2\
 net-tools\
 netcat\
 telnet\
 time\
 traceroute

# set up default locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# remove unneeded .deb files
RUN rm -r /var/lib/apt/lists/*