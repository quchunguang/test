#!/usr/bin/python3

with open("emp.data") as f:
    for line in f.readlines():
        fields = line.split(" ")
        #print("\t".join(fields), end="")
        print("Pay for %-8s %5.2f" % (fields[0], float(fields[1]) * float(fields[2])))
