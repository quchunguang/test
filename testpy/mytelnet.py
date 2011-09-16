#!/usr/bin/python
# LISTEN
# $ sudo netcat -l 999
import telnetlib

HOST = "localhost"
tn = telnetlib.Telnet(HOST, "999")
tn.write("Hello world\n")
print tn.read_all()
