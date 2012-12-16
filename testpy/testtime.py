#!/usr/bin/python
import sys
import os.path
import datetime


def main():
    """docstring for main"""
    filename = "/home/qcg/.vim/vimrc"
    path, name = os.path.split(filename)
    now = datetime.datetime.now()
    print sys.argv, "*" * 30, str(now)[:16]

if __name__ == "__main__":
    main()
