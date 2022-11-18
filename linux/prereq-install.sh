#!/bin/bash
echo "-----------------------------"
echo "   Actualizacion de Repos    "
echo "-----------------------------"
sudo apt update
echo "-----------------------------"
echo "  Instalacion de Azure CLI"
echo "-----------------------------"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
echo "-----------------------------"
echo "    Instalacion de Docker"
echo "-----------------------------"
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
#echo "-----------------------------"
#echo "    Docker Status            "
#echo "-----------------------------"
#sudo systemctl status docker
echo "-----------------------------"
echo " Installacion de Kubernetes"
echo "-----------------------------"
sudo apt -y install curl apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt -y install vim git curl wget kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
kubectl version --client && kubeadm version
echo "-----------------------------"
echo "      Instalacion Helm"
echo "-----------------------------"
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm


