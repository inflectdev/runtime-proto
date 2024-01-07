FROM ubuntu:24.04

WORKDIR /generate

RUN apt-get update && apt-get install -y \
    ca-certificates \
    protobuf-compiler \
    golang-go

RUN update-ca-certificates

# taken from this:
# https://github.com/docker-library/golang/blob/3a6407a6ff134ef6a0364ac061b0808f990ea14e/1.13-rc/alpine3.10/Dockerfile#L59-L60

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
