#!/bin/bash

SERVICE="${1}"

POD=$(kubectl get pods -n grpc-quickstart -l "app=$SERVICE" -o jsonpath="{.items[0].metadata.name}")

kubectl exec -it -n grpc-quickstart $POD -- /bin/bash
