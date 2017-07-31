"""
Created on 2012-12-22

@author: Administrator
"""
from socket import socket
from time import ctime


HOST = ''
PORT = 21567
BUFSIZE = 1024
ADDR = (HOST, PORT)

sock = socket(socket.AF_INET, socket.SOCK_STREAM)
sock.bind(ADDR)
sock.listen(5)

while True:
    print('Waiting ...')
    sock_c, addr = sock.accept()
    print('...connected from:', addr)

    while True:
        buffer = sock_c.recv(BUFSIZE)
        if not buffer:
            break
        line = '[' + ctime() + ']' + buffer.decode('utf-8')
        sock_c.send(line.encode('utf-8'))
    sock_c.close()
sock.close()
