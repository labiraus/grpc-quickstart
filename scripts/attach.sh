#!/bin/bash

APP="${1}"

POD=$(kubectl get pods -n grpc-quickstart -l "app=$APP" -o jsonpath="{.items[0].metadata.name}")

kubectl attach -n grpc-quickstart $POD -i