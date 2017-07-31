""" A temporary test program

    This is the details.
"""

# import collections
# import functools


# c = collections.defaultdict(str)
# c["a"] = "a"
# print(len(c))
# if c["a"] == "":
#     print("OK")

# s = "\taa bb"
# if s.startswith("\t"):
#     p = s.split(" ")
#     print(p)


# l1 = [1, 2, 3, 1, 4, 5]

# for i in li:
#     if i == 1:
#         li.remove(i)

# for idx, val in enumerate(l1):
#     if val == 1 or val == 4:
#         del l1[idx]

# print(l1)

# s = " "
# if s.isspace():
#     print('"%s" is space' % s)
# else:
#     print('"%s" is not space' % s)

# print("%d %d".rjust(20) % (2, 5))


# class Info:

#     """ A class for information

#         Descriptions.
#     """

#     def __init__(self):
#         self.name = ""
#         self.age = 0
#         self.addr = ""

#     def print_name(self):
#         print(self.name)
# print(globals().keys())


# info1 = Info()
# info1.name = "Kevin"
# info1.print_name()
# print(vars(info1))

# help("tmp")
# help("__main__")

# from ctypes import *

# msvcrt = cdll.msvcrt
# msvcrt.printf(b"Hello, World\n")
# msvcrt.printf(bytes("Hello\n\n".encode("utf-8")))

# with open("foo.txt", "w", encoding="utf-8") as f:
#     f.write("阿斯顿\n")
#     s = "a\xac\u1234\u20ac\U00008000"
#     f.write(s)

# with open("foo.txt", "r", encoding="utf-8") as f:
#     s = f.read()
# print(s)  # Error on Windows Chinese for '\xac' can not convert to 'gbk'.


# with open("foo.txt", "wb") as f:
#     f.write(bytes([0x41, 0x61, 0x0A]))
#     f.write(bytes([0x41, 0x61]))

# with open("foo.txt", "rb") as f:
#     lines = [line.decode("utf-8").rstrip('\n') for line in f]
#     print(lines)

# a = [1, 2]
# b = [1, 2]
# for x, y in zip(a, b):
#     print(x, y)

# s = "asdadddsd"
# sps = s.split(" ", 1)
# sps.append("")
# print(sps[1])

# ret = functools.reduce(lambda a, b: a * b, [1, 2, 3, 4], 1)
# print(ret)
# li = [1, 2, 3, 4]
# li.extend([5, 6])
# print(li)
