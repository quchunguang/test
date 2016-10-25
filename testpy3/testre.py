"""
Created on 2012-12-12

@author: qcg
"""
from re import compile as rec

s = "PING dd"
r = rec(r"PING.*")
if r.fullmatch(s):
    print("FIND")

d = {"name": "qcg", "birthday": "1999-09-09"}
print(type(rb"\n"), len(rb"\n"))
