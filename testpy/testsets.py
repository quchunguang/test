# -*- encoding: utf-8 -*-
# 交并补
A = [1, 2, 3, 4, 5]
B = [3, 4, 5, 6, 7]

for a in A:
    for b in B:
        if a == b:
            print "=", a
            break
    else:
        print "A", a

for b in B:
    for a in A:
        if a == b:
            break
    else:
        print "B", b
