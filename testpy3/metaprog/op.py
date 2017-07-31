from debug import debug


@debug
def add(x, y):
    return x + y


@debug
def sub(x, y):
    return x - y


print(add(2,3))
