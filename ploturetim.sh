#!/bin/bash
apt update
apt install
apt install unzip
apt install nodejs -y
apt install npm -y
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
apt-get install -y nodejs
apt-get update
apt install -y libsodium-dev cmake g++ git build-essential
git clone https://github.com/madMAx43v3r/chia-plotter.git
cd chia-plotter
git submodule update --init
./make_devel.sh
mkdir temp
chmod +777 temp
mkdir temp2
chmod +777 temp2
mkdir plots
sudo chmod +777 plots
wget https://github.com/bybrkaydn/servertestchiadriver/raw/main/googledriver.z>unzip googledriver.zip
rm googledriver.zip
unzip googledriver.zip
echo "Kurulum tamamlandı."
