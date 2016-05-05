def simple_decorator(f):
    print("simple_decorator()")
    return f


def replace_decorator(f):
    return lambda: print("replace_decorator()")


def wrapper_decorator(f):
    def wrapper():
        print("wrapper_decorator: before")
        f()
        print("wrapper_decorator: after")
    return wrapper


def deprecated(func):
    """Print a deprecation warning once on first use of the function.

    >>> @deprecated                      # doctest: +SKIP
    ... def f():
    ...     pass
    >>> f()                              # doctest: +SKIP
    f is deprecated
    """
    count = [0]

    def wrapper(*args, **kwargs):
        count[0] += 1
        if count[0] == 1:
            print(func.__name__, 'is deprecated')
        return func(*args, **kwargs)
    return wrapper


@simple_decorator
@replace_decorator
@wrapper_decorator
def f():
    print("f()")


def main():
    f()


if __name__ == '__main__':
    main()
