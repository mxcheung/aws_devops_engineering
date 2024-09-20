#!/bin/bash

echo 'Installing prerequisites...'
sudo yum install gcc openssl-devel bzip2-devel libffi-devel -y

echo 'Downloading Python3.9.6 installation package...'
cd /opt 
sudo wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz

echo 'Extracting the Python3.9.6 archive...'
sudo tar xzf Python-3.9.6.tgz 

echo 'Install Python3.9.6'
cd Python-3.9.6 
sudo ./configure --enable-optimizations 
sudo make altinstall

echo 'Clean up source archive...'
sudo rm -f /opt/Python-3.9.6.tgz 

echo 'Clean up installPython3.9.sh file...'
sudo rm -f ~/environment/lab4-app/installPython3.9.sh