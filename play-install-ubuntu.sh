#! /bin/sh

sudo apt-get update
sudo apt-get install -y unzip
sudo apt-get install -y curl
sudo curl -O https://downloads.typesafe.com/typesafe-activator/1.3.10/typesafe-activator-1.3.10.zip
sudo unzip typesafe-activator-1.3.10.zip -d / && sudo rm -rf typesafe-activator-1.3.10.zip && sudo chmod 777 /activator-dist-1.3.10/bin/activator
export PATH=$PATH:/activator-dist-1.3.10/bin/

