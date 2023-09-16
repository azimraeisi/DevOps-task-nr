#!/usr/bin/env bash
#install pip,git
sudo apt update && \
sudo apt install python3-pip git -y

#clone kubespray and install
git clone -b v2.23.0 https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip3 install -r requirements.txt
cp -r inventory/sample inventory/mysinglecluster

cat <<EOF > inventory/mysinglecluster/inventory.ini
[all]
localhost ansible_connection=local

[kube-master]
localhost

[kube-node]
localhost

[etcd]
localhost

[k8s-cluster:children]
kube-master
kube-node
EOF

ansible-playbook -i inventory/mysinglecluster/inventory.ini cluster.yml -b -v

