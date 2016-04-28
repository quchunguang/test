import collections

c = collections.defaultdict(str)
# c["a"] = "a"
print(len(c))
if c["a"] == "":
    print("OK")

s = "\taa bb"
if s.startswith("\t"):
    p = s.split(" ")
    print(p)


li = [1, 2, 3, 1, 4, 5]

# for i in li:
#     if i == 1:
#         li.remove(i)

for idx, val in enumerate(li):
    if val == 1 or val == 4:
        del li[idx]

print(li)
