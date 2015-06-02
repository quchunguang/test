import sys
import socket
import string

HOST = "chat.freenode.net"
PORT = 6667
NICK = "qu"
IDENT = "kevin"
REALNAME = "Keivn Qu"
readbuffer = ""

s = socket.socket()
s.connect((HOST, PORT))
s.send("NICK %s\r\n" % NICK)
s.send("USER %s %s bla :%s\r\n" % (IDENT, HOST, REALNAME))

while True:
    readbuffer = readbuffer + s.recv(1024)
    temp = string.split(readbuffer, "\n")
    readbuffer = temp.pop()

    for line in temp:
        line = string.rstrip(line)
        line = string.split(line)

        if(line[0] == "PING"):
            s.send("PONG %s\r\n" % line[1])
