# Find same files contains something like xxx-ddd form in file name.
#
# 1. Total commander: expand sub-folders.
# 2. Total commander: generate the list of files as av.list.
# 3. This script: to generate av.tsv.
# 4. Microsoft Excel: new document and data -> import from file -> utf-8,\t.
import re


li = []
ret = []
p = re.compile(r"([A-Za-z]+)\-([0-9]+)")
with open("av.list", encoding="utf-8") as f:
    for line in f:
        m = p.search(line)
        if m:
            idd = m.group(0).lower()
            if idd in li:
                if idd not in ret:
                    ret.append(idd)
            else:
                li.append(idd)

li = []
with open("av.list", "r", encoding="utf-8") as f:
    for line in f:
        for i in ret:
            if i in line.lower():
                li.append(i + "\t" + line)

li.sort()

with open("result.tsv", "w", encoding="utf-8") as w:
    for i in li:
        w.write(i)
