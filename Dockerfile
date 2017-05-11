FROM ubuntu:zesty
LABEL maintainer="H0l0 Gram" description="ubuntu with go, git, gcc"

RUN apt-get update \
 && apt-get install wget -y \
 && rm -rf /var/lib/apt/lists/*
RUN wget -O - https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz \
  | tar -xzC /usr/local \
&& mkdir ~/go/src -p
ENV PATH "$PATH:/usr/local/go/bin:~/go/bin:~"
ENV GOPATH "/root/go"
RUN apt-get update && apt-get install -y git \
    make \
    gcc \
    gcc-arm-linux-gnueabihf \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /root
CMD ["/bin/bash"]

