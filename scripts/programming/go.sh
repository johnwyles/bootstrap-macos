#!/usr/bin/env bash

brew install go

# Some key imports for the IDEs
go install golang.org/x/tools/cmd/godoc@latest
go install github.com/golang/lint/golint@latest
# go get github.com/derekparker/delve/cmd/dlv
# go get github.com/golang/dep/cmd/dep
# go get golang.org/x/tools/cmd/goimports
# go get golang.org/x/tools/cmd/gorename
# go get github.com/sqs/goreturns
# go get github.com/mdempsky/gocode
# go get github.com/alecthomas/gometalinter
# go get github.com/zmb3/gogetdoc
# go get github.com/zmb3/goaddimport
# go get github.com/rogpeppe/godef
# go get golang.org/x/tools/cmd/guru
# go get github.com/fatih/gomodifytags
# go get github.com/tpng/gopkgs
# go get github.com/ramya-rao-a/go-outline

# Utilities
# go get github.com/urfave/cli
# go get github.com/peter-jozsa/jsonpath
# go get github.com/hashicorp/go-multierror

# Install Protobuf and gRPC
brew install protobuf
go install google.golang.org/grpc@latest

# MongoDB
#go get gopkg.in/mgo.v2
#go install go.mongodb.org/mongo-driver/mongo@latest

# go-kit
# go get github.com/go-kit/kit/...
# go get github.com/kujtimiihoxha/kit/...

# Iris
# go get github.com/kataras/iris/...

# Install the AWS SDK
#go install github.com/aws/aws-sdk-go/...

# Install the GCP SDK
#go install cloud.google.com/go/...
