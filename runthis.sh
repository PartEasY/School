#!/bin/bash

sudo mkdir -p home/Documents/
sudo mkdir -p home/Desktop/
sudo mkdir -p home/Downloads/
sudo mkdir -p home/Pictures/
sudo mkdir -p home/Videos/

for i in 1 2 3 4 5
do
sudo mkdir folder$i
done

File="users.txt"
Lines=$(cat $File)
for line in $Lines
do
user=$line
adduser $user
usermod -aG sudo $user
sudo mkdir -pv $user/Documents/
sudo mkdir -pv $user/Desktop/
sudo mkdir -pv $user/Downloads/
sudo mkdir -pv $user/Pictures/
sudo mkdir -pv $user/Videos/
done

sudo apt update
sudo apt upgrade

sudo apt install ufw
sudo apt install git-all
sudo apt install nginx
sudo apt install net-tools

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


