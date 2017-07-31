#!/usr/bin/python
li = [1, 2, 3, 1, 4, 5]

# wrong 1
for v in li:
    if v == 1 or v == 2:
        li.remove(v)

# wrong 2
for idx, v in enumerate(li):
    if v == 1 or v == 2:
        del li[idx]

# wrong 3
for idx, v in enumerate(li[:]):
    if v == 1 or v == 2:
        del li[idx]

# not recommend
for v in li[:]:
    if v == 1 or v == 2:
        li.remove(v)

# recommend 1
li = list(filter(lambda x: x != 1 and x != 2, li))

# recommend 2
li = [x for x in li if x != 1 and x != 2]
