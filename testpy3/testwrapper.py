import time
import math


def time_it(f):
    def wrapper(*args):
        start = time.clock()
        ret = f(*args)
        print(f.__name__, end='() -> ')
        print(time.clock() - start, end=' seconds\n')
        return ret
    return wrapper


@time_it
def calc():
    l = len(str(2 ** 1000000))
    print(l)


@time_it
def calc2():
    l = 1000000 * math.log10(2)
    print(round(l))


@time_it
def calc3():
    l = 1000000 * math.log(2) / math.log(10)
    print(round(l))


@time_it
def main():
    calc()
    calc2()
    calc3()

if __name__ == "__main__":
    main()
