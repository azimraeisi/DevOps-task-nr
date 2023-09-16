# K8s single node and install wordpress via helm
### What is the goal?

This repository contains the necessary tools and configurations to set up a Kubernetes cluster on a single node (Control Plane + Worker) using Kubespray, and to deploy a WordPress application, MySQL, PhpMyAdmin and nginx-ingress using Helm with one click without a load balancer in a VPS with one public IP.

Access to WordPress URL: yourdomain.com/wordpress
Access to phpmyadmin URL: yourdomain.com/wordpress

### Warning:
Important: This setup uses non-persistent storage. Consequently, any data saved will be lost after a restart.

## Installation and usage:

You need:
  - root access to VPS with Ubuntu 22.04 

### Get started:
enter in your terminal:

```bash
$ ssh root@your-server-ip
$ git clone https://github.com/azimraeisi/DevOps-task-nr
$ bash install.sh &
```
It takes 10~15 minutes. Execute the script and have a cup of coffee till the installation is finished.
