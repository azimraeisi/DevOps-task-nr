#!/usr/bin/env bash
source ../vars.txt
helm dependency build
helm install test .

sleep 30s
POD_NAME=$(kubectl get pods -l app.kubernetes.io/name=wordpress -o jsonpath="{.items[0].metadata.name}")
kubectl exec $POD_NAME -- /bin/sh -c "ln -s /opt/bitnami/wordpress /opt/bitnami/wordpress/wordpress"
