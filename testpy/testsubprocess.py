#!/usr/bin/python
import subprocess

subprocess.call("ls -l $PWD/", shell=True)
subprocess.call(["ls", "-l", "/home/qcg/"])
subprocess.call("for i in 1 2 3; do echo $i; done", shell=True)
