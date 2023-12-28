#!/bin/bash

# Update package lists and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Install Jenkins
sudo apt install openjdk-17-jdk -y

# Add Jenkins repository and install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null    
sudo apt update
sudo apt install jenkins -y

# Start and enable Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git
sudo apt install git -y

# Install Terraform
sudo apt install -y gnupg software-properties-common curl
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform -y

# Install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
