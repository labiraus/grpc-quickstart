#!/bin/bash

choco upgrade chocolatey

choco install -y docker-desktop
choco upgrade docker-desktop

choco install -y kind
choco upgrade kind

choco install -y kubernetes-helm
choco upgrade kubernetes-helm

choco install -y skaffold
choco upgrade skaffold

choco install -y linkerd2
choco upgrade linkerd2

choco install -y protoc
choco upgrade protoc

go get \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2 \
    google.golang.org/protobuf/cmd/protoc-gen-go \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc \
    github.com/mwitkow/go-proto-validators/protoc-gen-govalidators
