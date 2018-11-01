FROM ubuntu:16.04

RUN  apt update  && \
      apt-get install wget git curl unzip -y  && \
      wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz  && \
      tar -C /usr/local -xzf go1.11.1.linux-amd64.tar.gz  && \
     export PATH=$PATH:/usr/local/go/bin  && \
     export GOPATH=/root/go/  && \ 
     export PATH=$PATH:$GOPATH/bin  && \
     go version  && \
     go get -u google.golang.org/grpc  && \
     curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip  && \
     unzip protoc-3.2.0-linux-x86_64.zip -d protoc3  && \ 
     mv protoc3/bin/* /usr/local/bin/  && \ 
     mv protoc3/include/* /usr/local/include/  && \
     go get -u github.com/golang/protobuf/protoc-gen-go  && \
     go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway  && \
     go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger

ENV PATH="$PATH:/usr/local/go/bin"
ENV GOPATH="/root/go/"
ENV PATH="$PATH:$GOPATH/bin"

