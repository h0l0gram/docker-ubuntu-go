FROM ubuntu:xenial
LABEL maintainer="H0l0 Gram" description="ubuntu with go, git, gcc"

ADD https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz /tmp/go1.8.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /tmp/go1.8.1.linux-amd64.tar.gz \
&& mkdir ~/go/src -p 
ENV PATH "$PATH:/usr/local/go/bin"
ENV PATH "$PATH:~/go/bin:~"
ENV GOPATH "/root/go"
RUN apt-get update && apt-get install -y git \
&& apt-get install -y make \
&& apt-get install -y gcc \
&& apt-get install -y gcc-arm-linux-gnueabihf 
WORKDIR /root
CMD ["/bin/bash"]

