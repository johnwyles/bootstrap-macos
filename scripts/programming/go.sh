#!/usr/bin/env bash

brew install go
go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint
go get github.com/derekparker/delve/cmd/dlv
go get github.com/nsf/gocode

# Install Protobuf and gRPC
brew install protobuf
# go get github.com/micro/protobuf/{proto,protoc-gen-go}
go get github.com/micro/protoc-gen-micro
go get google.golang.org/grpc
go get github.com/jteeuwen/go-bindata/...
go get github.com/micro/go-plugins/...

# go-kit
go get github.com/go-kit/kit/...

# Iris
go get github.com/kataras/iris

# Install the AWS SDK
go get github.com/aws/aws-sdk-go/...
