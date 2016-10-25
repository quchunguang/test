
def threepart(s1, s2):
    return s1 - s2, s1 & s2, s2 - s1


s1 = {1, 2, 3}
s2 = {2, 3, 4}

print(threepart(s1, s2))


s3 = set()
s3.add(("a", 1))
s3.add(("b", 2))
s3.add(("c", 3))
s4 = set()
s4.add(("b", 2))
s4.add(("c", 3))
s4.add(("d", 4))
s4.add(frozenset([1, 2, 3]))
print(threepart(s3, s4))

d1 = {"a": 1, "b": 2, "c": 3}
d2 = {"b": 2, "c": 3, "d": 4}
# d1.sort()
print(d1)

l2 = [1, 4, 5, 2, 3]
l2.sort()
print(l2)


def threepart2(l1, l2):
    p1, p2, p3 = [], [], []
    for i in l1:
        if i in l2:
            p2.append(i)
        else:
            p1.append(i)
    for j in l2:
        if j not in l1:
            p3.append(j)
    return p1, p2, p3

l3 = [1, 2, 3]
l4 = [2, 3, 4]
print(threepart2(s1, s2))

d1 = {"a": 1, "b": 2, "c": 3}
d2 = {"b": 2, "c": 3, "d": 4}
print(threepart2(s1, s2))

s1 = {1, 2, 3}
s2 = {2, 3, 4}
print(threepart2(s1, s2))
