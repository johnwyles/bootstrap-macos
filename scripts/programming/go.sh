#!/usr/bin/env bash

brew install go
go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint

# Install the AWS SDK
go get -u github.com/aws/aws-sdk-go/...
