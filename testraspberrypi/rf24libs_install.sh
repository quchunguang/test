#!/bin/bash

ROOT_PATH="./rf24libs"

sudo apt-get install libncurses5-dev
git clone https://github.com/tmrh20/RF24.git ${ROOT_PATH}/RF24
sudo make install -B -C ${ROOT_PATH}/RF24
git clone -b Development https://github.com/tmrh20/RF24Network.git ${ROOT_PATH}/RF24Network
sudo make install -B -C ${ROOT_PATH}/RF24Network
git clone https://github.com/tmrh20/RF24Mesh.git ${ROOT_PATH}/RF24Mesh
sudo make install -B -C ${ROOT_PATH}/RF24Mesh
git clone https://github.com/tmrh20/RF24Gateway.git ${ROOT_PATH}/RF24Gateway
sudo make install -B -C ${ROOT_PATH}/RF24Gateway
make -B -C${ROOT_PATH}/RF24Gateway/examples/ncurses
echo "Complete, to run the example, cd to rf24libs/RF24Gateway/examples/ncurses and enter  sudo ./RF24Gateway_ncurses"
ls ${ROOT_PATH}
