#!/usr/bin/env python3
import sys
import os


def output_r(f, r):
    for k in r:
        if r[k] != "":
            f.write(k + ": " + r[k] + "\n")


def save(arg):
    print("[save]", arg)
    with open(results_out, 'w') as f:
        for r in addr:
            output_r(f, r)
            f.write("\n")


def add(arg):
    global addr
    print("[add]", arg)
    r = {}
    for seg in arg.split("; "):
        k, v = seg.split(" ", 1)
        r[k] = v
    addr.append(r)


def delete(arg):
    global addr
    print("[delete]", arg)
    sps = arg.split("; ", 1)  # name: sps[0], birthday(optional): sps[1]
    if len(sps) == 1:
        # using list.get() with default value to avoid KeyError
        # make addr collections.defaultdict instead will cause empty r["name"]
        # here when compare.
        addr = [r for r in addr if r.get("name", "") != sps[0]]
    elif len(sps) == 2:
        addr = [r for r in addr
                if r.get("name", "") != sps[0] or r.get("birthday") != sps[1]]


def query(arg):
    print("[query]", arg)
    k, v = arg.split(" ", 1)
    ret = [r for r in addr if r.get(k, "") == v]

    with open(reports_out, 'a') as f:
        title = k + " = " + v
        f.write("[query] " + title + "\n")
        for r in ret:
            output_r(f, r)
            f.write("\n")
        f.write("[end]" + "\n\n")


def read_addr():
    global addr
    lines = []
    with open(contacts_file, 'r') as f:
        lines = [line.rstrip('\n') for line in f]

    lines.append('')  # last record
    r = {}
    key = "BUG"
    for line in lines:
        if line == '':
            if len(r) > 0:
                addr.append(r)
                r = {}
                key = ""
            continue
        if line.startswith("\t"):
            r[key] += "\n" + line
        else:
            key, value = line.split(" ", 1)
            r[key] = value


def proc_instr():
    lines = []
    with open(instructions_file, 'r') as f:
        lines = [line.rstrip('\n') for line in f if not line.isspace()]

    for line in lines:
        sps = line.split(" ", 1)
        # if the instruction has no arguments, pass ""
        if len(sps) == 1:
            sps.append("")
        globals()[sps[0]](sps[1])  # calling function


def check_files():
    if not os.path.isfile(contacts_file):
        print("[ERROR] contacts_file not exist")
        sys.exit(2)

    if not os.path.isfile(instructions_file):
        print("[ERROR] instructions_file not exist")
        sys.exit(3)

    if os.path.isfile(results_out):
        os.remove(results_out)

    if os.path.isfile(reports_out):
        os.remove(reports_out)


if len(sys.argv) != 5:
    print("""
Usage Example:
    python struct.py contacts_4.txt instructions_4.txt results_4.txt reports_4.txt
""")
    sys.exit(1)

addr = []
contacts_file, instructions_file, results_out, reports_out = sys.argv[1:]
check_files()
read_addr()
proc_instr()
