class decorator_class(object):
    """docstring for DecoratorClass"""

    def __init__(self, arg):
        super(decorator_class, self).__init__()
        self.arg = arg

    def __call__(self, function):
        print("Decorator Class()")
        return function


class replacing_decorator_class(object):
    def __init__(self, arg):
        # this method is called in the decorator expression
        print("in decorator init, %s" % arg)
        self.arg = arg

    def __call__(self, function):
        # this method is called to do the job
        print("in decorator call, %s" % self.arg)
        self.function = function
        return self._wrapper

    def _wrapper(self, *args, **kwargs):
        print("in the wrapper, %s %s" % (args, kwargs))
        return self.function(*args, **kwargs)


deco = decorator_class("foo")
replace = replacing_decorator_class('foo')


@deco
def f():
    print("f()")


@replace
def g():
    print("g()")


def main():
    f()
    g()


if __name__ == '__main__':
    main()
