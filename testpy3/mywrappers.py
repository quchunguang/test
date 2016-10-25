def beginend(func):
    def wrapper(*args):
        print('=' * 36 + ' BEGIN ' + '=' * 36)
        func(*args)
        print('=' * 36 + '  END  ' + '=' * 36)
    return wrapper


def attrs(**kwds):
    def decorate(f):
        for k in kwds:
            setattr(f, k, kwds[k])
        return f
    return decorate


@attrs(versionadded="2.2", author="Guido van Rossum")
def mymethod(i):
    print('mymethod() i=%d' % i)
# mymethod = attrs(versionadded="2.2", author="Guido van Rossum")(mymethod)


@beginend
def testwrapper(a, b):
    print('in testwrapper() a=%d' % a)
    print('in testwrapper() b=%d' % b)
# testwrapper = beginend(testwrapper)

testwrapper(1, 2)
mymethod(1)
print(mymethod.author)
