import hashlib

print hashlib.md5("superman").hexdigest()

m = hashlib.md5()
m.update("super")
m.update("man")
print m.hexdigest()

print hashlib.algorithms
