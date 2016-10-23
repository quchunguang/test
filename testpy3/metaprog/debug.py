def debug(func):
    def wapper(*args, **kwargs):
        print(func.__name__)
        return func(*args, **kwargs)
    return wapper
