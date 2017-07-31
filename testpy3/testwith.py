

with open("foo.txt", "r") as r, \
        open("foo.csv", "w") as w:
    buf = r.read()
    output = ",".join(buf.split(" "))
    w.write(output)
