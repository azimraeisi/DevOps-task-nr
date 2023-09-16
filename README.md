Kubernetes & Helm Setup for WordPress, MySQL & PhpMyAdmin
This repository contains the necessary tools and configurations to set up a Kubernetes cluster on a single node (Control Plane + Worker) using Kubespray, and to deploy a WordPress application, MySQL, and PhpMyAdmin using Helm.

Important: This setup uses non-persistent storage. Consequently, any data saved will be lost after a restart.

Features
Single-node Kubernetes cluster setup (Control Plane + Worker) using Kubespray.
Helm Chart containing:
WordPress with Ingress configuration.
MySQL Deployment.
PhpMyAdmin Deployment with Ingress.
Prerequisites
VPS running Ubuntu 22.
login as root
clone the project and run "bash install.sh"
