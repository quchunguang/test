FROM ubuntu
RUN echo "deb http://cn.archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y fortunes cowsay
CMD /usr/games/fortune -a | /usr/games/cowsay
