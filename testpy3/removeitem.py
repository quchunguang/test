#!/usr/bin/python
li = [1, 2, 3, 1, 4, 5]

# wrong 1
for i in li:
    if i == 1 or i == 2:
        li.remove(i)

# wrong 2
for idx, i in enumerate(li):
    if i == 1 or i == 2:
        del li[idx]

# wrong 3
for idx, i in enumerate(li[:]):
    if i == 1 or i == 2:
        del li[idx]

# not recommend
for i in li[:]:
    if i == 1 or i == 2:
        li.remove(i)

# recommend 1
li = list(filter(lambda x: x != 1 and x != 2, li))

# recommend 2
li = [x for x in li if x != 1 and x != 2]

print(list(li))
