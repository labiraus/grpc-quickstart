#!/bin/bash

SERVICE="${1}"
PORT="${2:-8080}"

POD=$(kubectl get pods -n grpc-quickstart -l "app=$SERVICE" -o jsonpath="{.items[0].metadata.name}")
echo $POD
kubectl port-forward -n grpc-quickstart pods/$POD $PORT
