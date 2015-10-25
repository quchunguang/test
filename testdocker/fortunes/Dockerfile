# Dockerfile for demo
FROM ubuntu
MAINTAINER Kevin Qu <quchunguang@gmail.com>
ENV PATH /usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ADD README.md /
RUN echo "deb http://cn.archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y fortunes cowsay
CMD fortune -a | cowsay
