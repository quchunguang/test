import itertools


def g():
    print('--start--')
    for i in itertools.count():
        print('--yielding %i--' % i)
        try:
            ans = yield i
        except GeneratorExit:
            print('--closing--')
            raise
        except Exception as e:
            print('--yield raised %r--' % e)
        else:
            print('--yield returned %s--' % ans)

it = g()
next(it)
it.send(11)
it.throw(IndexError)
it.close()
