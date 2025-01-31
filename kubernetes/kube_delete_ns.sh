#!/bin/bash

NAMESPACE=$1

if [ -z "$NAMESPACE" ]; then
    echo "Usage: $0 <namespace>"
    exit 1
fi

kubectl proxy &
PROXY_PID=$!

kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' > ./temp.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize

kill -9 $PROXY_PID
rm ./temp.json
