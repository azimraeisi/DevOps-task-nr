#!/usr/bin/env bash

sudo bash install-k8s.sh
sudo bash install-helm.sh

sudo bash helm-chart/install-helm-packages.sh

##install certbot and update ingress
sudo bash cert.sh
