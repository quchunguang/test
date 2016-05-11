#!/usr/bin/env python3
import sys
import os
from re import compile as rec


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

    # check keys exist
    if "name" not in r or "birthday" not in r:
        return

    # if r already exist in addr, update only
    while rr in addr:
        if rr["name"] == r["name"] and rr["birthday"] == r["birthday"]:
            for k in r:
                rr[k] = r[k]
            return

    # else, add it
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


def check_addr():
    reprs = {
        "name": rec(r'[a-zA-Z ]+'),
        "birthday": rec(r'[0-3]?[0-9]\-[01]?[0-9]\-[12][0-9]{3}'),
        "phone": rec(r'0*[1-9][0-9]*'),
        "address": rec(r'.+'),
        "email": rec(r'[^@ ]+@[^@ ]+')
    }
    with open(reports_out, 'a') as f:
        for r in addr:
            for k in r:
                if k not in reprs or not reprs[k].fullmatch(r[k]):
                    f.write("[check] {}: {}".format(k, r[k]))


def read_addr():
    global addr
    lines = []
    with open(contacts_in, 'r') as f:
        lines = [line.rstrip('\n') for line in f]

    lines.append('')  # last record
    r = {}
    key = "BUG"
    for line in lines:
        if line.strip() == '':
            if len(r) > 0:
                if "name" in r and "birthday" in r:  # check keys exist
                    addr.append(r)
                r = {}
                key = ""
            continue
        if line.startswith("\t"):
            r[key] += "\n" + line
        else:
            key, value = line.split(" ", 1)
            r[key] = value


def exec_instr():
    lines = []
    with open(instructions_in, 'r') as f:
        lines = [line.rstrip('\n') for line in f if not line.isspace()]

    for line in lines:
        sps = line.split(" ", 1)
        # if the instruction has no arguments, pass ""
        if len(sps) == 1:
            sps.append("")
        globals()[sps[0]](sps[1])  # calling function


def check_files():
    if not os.path.isfile(contacts_in):
        print("[ERROR] contacts_in not exist")
        sys.exit(2)

    if not os.path.isfile(instructions_in):
        print("[ERROR] instructions_in not exist")
        sys.exit(3)

    if os.path.isfile(results_out):
        os.remove(results_out)

    if os.path.isfile(reports_out):
        os.remove(reports_out)


def get_args():
    usage = """Usage Example:

python3 struct.py contacts_4.txt instructions_4.txt results_4.txt reports_4.txt
"""
    if len(sys.argv) != 5:
        print(usage, file=sys.stderr)
        sys.exit(1)
    return sys.argv[1:]


contacts_in, instructions_in, results_out, reports_out = get_args()  # files
addr = []      # address book, global

check_files()  # check r-files exist and remove w-files if exists
read_addr()    # read contacts file to addr
check_addr()   # check addr format and write report if has error
exec_instr()   # execute instructions in instructions file to reports/results
