#!/bin/bash
rm rf_recv
g++ -Wall -Ofast -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -lrf24-bcm rf_recv.cpp -o rf_recv
sudo ./rf_recv
