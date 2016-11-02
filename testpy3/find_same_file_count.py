import re
import collections


d = collections.defaultdict(int)
with open("av.list", "r", encoding="utf-8") as f:
    for line in f:
        m = re.search(r'([a-zA-Z]+)\-([0-9]+)', line)
        if m:
            d[m.group(1).lower()] += 1

d = sorted(d.items(), key=lambda item: item[1], reverse=True)
print(d)
