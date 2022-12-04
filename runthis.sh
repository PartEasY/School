#!/bin/bash
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