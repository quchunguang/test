#!/bin/bash
sudo docker build -t fortunes .
sudo docker tag fortunes quchunguang/fortunes:latest
