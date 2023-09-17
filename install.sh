#!/usr/bin/env bash
sudo apt update && \
sudo apt install curl -y

sudo bash install-k8s.sh
sudo bash install-helm.sh
cd helm-chart
sudo bash install-helm-packages.sh

##install certbot and update ingress
cd ..
sudo bash cert.sh
