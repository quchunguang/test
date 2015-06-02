# -*- coding: utf-8 -*-
# while 1:
#     a = int(raw_input())
#     if a == 42:
#         break
#     print a

#################################################
import sys
def prime_in(a, b):
    global max_ever, primes
    if b <= max_ever:
        return
    for a in range(max_ever, b):
        for p in primes:
            if a % p == 0:
                break
        else:
            primes.append(a)
    max_ever = b


max_ever = 10
primes = [2, 3, 5, 7, ]
for line in sys.stdin:
    r = line.split()
    if len(r) != 2:
        continue
    a, b = int(r[0]), int(r[1])
    prime_in(a, b)
    print '\n'.join([str(i) for i in primes if i >= a and i <= b])
