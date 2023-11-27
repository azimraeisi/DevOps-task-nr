# k8s single node and install wordpress+mysql+phpmyadmin via helm
### What is the goal?

This repository contains the necessary tools and configurations to set up a Kubernetes cluster on a single node (Control Plane + Worker) using Kubespray, and to deploy a WordPress application, MySQL, PhpMyAdmin and nginx-ingress using Helm with one click without a load balancer in a VPS with one public IP.

- Access to wordpress URL: https://yourdomain.com/wordpress
- Access to wordpress URL: https://yourdomain.com/wordpress/wp-admin
- Access to phpmyadmin URL: https://yourdomain.com/dbadmin



### Warning:
Important: This setup uses non-persistent storage. Consequently, any data saved will be lost after a restart.

## Installation and usage:

You need:
  - root access to VPS with Ubuntu 22.04 

### Get started:
enter in your terminal:

```bash
$ ssh root@your-server-ip
$ git clone https://github.com/samraeisi/k8s-singlenode-wordpress
$ cd k8s-singlenode-wordpress
$ bash install.sh &
```
It takes 10~15 minutes. Execute the script and have a cup of coffee till the installation is finished.

### Variables:
You can change username, password for wordpress and mysql in vars.txt file.
