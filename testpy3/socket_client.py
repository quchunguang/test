"""
Created on 2012-12-22

@author: Administrator
"""
from socket import socket


HOST = 'localhost'
PORT = 21567
BUFSIZ = 1024
ADDR = (HOST, PORT)

socket = socket(socket.AF_INET, socket.SOCK_STREAM)
socket.connect(ADDR)
while True:
    line = input('> ')
    if not line:
        break
    socket.send(line.encode('utf-8'))
    buffer = socket.recv(BUFSIZ)
    if not buffer:
        break
    print(buffer.decode('utf-8'))
socket.close()
