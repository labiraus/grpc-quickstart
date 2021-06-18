# grpc-quickstart

This is a work in progress - on hold as of 2021/06/18 in favour of <https://github.com/labiraus/kata-react>

## Intro

A quickstart guide to grpc based kubernetes microservice development
This codebase uses buf to build proto files that it pulls from the git repo and deploy them into each language's application.

These protobuf files are drawn from the git repo rather than locally because the most common commercial microservice use case sees one repo per application rather than a monorepo. Whilst there is some stylistic debate between having a central proto repo and having each app's repo hold that app's published api, pulling the committed proto files from a repo supports both and is a feature of the Buf tool. This is also the most likely path for a futureproof process of transitioning from a JSON to a proto api.

## Code Flow

When running, each app will be built into a docker container and deployed into a kubernetes cluster.
The api app will contain the entrypoint for the cluster and will make a call to each of the other apps asking for them to provide a personalized greeting.
Each of these apps will first call back to the api app to get permission to continue before returning their greeting.
The api will then return all of these greetings, proving that each language app supports both an inbound and outbound protobuf channel.

## Tooling

### Kubernetes

For further details on the kubernetes implementation see <https://github.com/labiraus/k8s-quickstart>

### Buf

For further deails on buf see <https://docs.buf.build/>
This tool is designed to wrap the standard protobuf compilier <https://grpc.io/docs/protoc-installation/>
The buf.yaml file in the root of this repository relates to the finding, linting and building of the proto files.
The buf.gen.yaml files within each of the apps define which tools should be used to generate the language specific code. By default, buf generate will look for a binary named protoc-gen-NAME on your $PATH.
Buf has a number of other functions and can be used to lint, detect breaking changes, or build a compiled version of the proto code.

### Make

Each application uses a Makefile to script the generating of the protobuf files.

### Docker

Each app contains a dockerfile definition that allows it to be built into a docker container. This is to enable the source code to be downloaded and deployed locally with minimal installation of language specific tooling.

## Language Integration

### C# (csharp)

To gen the proto files into C# the protoc-gen-csharp tool is required.
Alternatively, .proto files can be included in a project as detailed here: <https://github.com/grpc/grpc/blob/master/src/csharp/BUILD-INTEGRATION.md>
