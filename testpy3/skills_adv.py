#!/usr/bin/env python3
# https://linux.cn/article-6584-1.html
from functools import partial
import csv


# 1. only listed can be seen outside
__all__ = ['export_func']


def export_func():
    print("export_func")


def unexport_func():
    print("unexport_func")


# 2. 常见with使用场景,__enter__()方法的返回值赋值给了my_file,
class MyWith(object):
    def __init__(self, id):
        self.id = id
        print("__init__ method")

    def __enter__(self):
        print("__enter__ method")
        return self  # 返回对象给as后的变量

    def __exit__(self, exc_type, exc_value, exc_traceback):
        print("__exit__ method")
        if exc_traceback is None:
            print("Exited without Exception")
            return True
        else:
            print("Exited with Exception")
            return False


def test_with():
    with MyWith(1) as my_with:
        print("running my_with", my_with.id)
    print("------分割线-----")
    with MyWith(2) as my_with:
        print("running my_with", my_with.id)
        print("running before Exception")
        raise Exception
        print("running after Exception")


# 3. filter function
def test_filter():
    lst = [1, 2, 3, 4, 5, 6]
    # 所有奇数都会返回True, 偶数会返回False被过滤掉
    print(list(filter(lambda x: x % 2 != 0, lst)))


# 4. if-else in line
def one_line_if():
    lst = [1, 2, 3]
    new_lst = lst[0] if lst is not None else -1
    print(new_lst)


# singleton patten
def singleton(cls):
    """单例装饰器
    """
    instances = dict()  # 初始为空

    def _singleton(*args, **kwargs):
        if cls not in instances:  # 如果不存在, 则创建并放入字典
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]
    return _singleton


@singleton
class Test(object):
    pass


# 6. classmethod staticmethod
class A(object):
    # 普通成员函数
    def foo(self, x):
        print("executing foo(%s, %s)" % (self, x))

    @classmethod   # 使用classmethod进行装饰
    def class_foo(cls, x):
        print("executing class_foo(%s, %s)" % (cls, x))

    @staticmethod  # 使用staticmethod进行装饰
    def static_foo(x):
        print("executing static_foo(%s)" % x)


def test_three_method():
    obj = A()
    # 直接调用普通的成员方法
    obj.foo("para")         # 此处obj对象作为成员函数的隐式参数, 就是self
    obj.class_foo("para")   # 此处类作为隐式参数被传入, 就是cls
    A.class_foo("para")     # 更直接的类方法调用
    obj.static_foo("para")  # 静态方法并没有任何隐式参数, 但是要通过对象或者类进行调用
    A.static_foo("para")


# 7. property
class Student(object):
    @property  # 相当于property.getter(score) 或者property(score)
    def score(self):
        return self._score

    @score.setter  # 相当于score = property.setter(score)
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value

    @score.deleter
    def score(self, value):
        pass


# 8. iter magic
class TestIter(object):
    def __init__(self):
        self.lst = [1, 2, 3, 4, 5]

    def read(self):
        for ele in range(len(self.lst)):
            yield ele

    def __iter__(self):
        return self.read()

    def __str__(self):
        return ','.join(map(str, self.lst))

    __repr__ = __str__


def test_iter():
    obj = TestIter()
    for num in obj:
        print(num)
    print(obj)


# 9. partial function
def sum(a, b):
    return a + b


def test_partial():
    fun = partial(sum, 2)   # 事先绑定一个参数, fun成为一个只需要一个参数的可调用变量
    print(fun(3))  # 实现执行的即是sum(2, 3)


# (about)
def partial2(func, *part_args):
    def wrapper(*extra_args):
        args = list(part_args)
        args.extend(extra_args)
        return func(*args)
    return wrapper


# 10. eval
def test_first():
    return 3


def test_second(num):
    return num


def test_third():
    print("third")


action = {  # 可以看做是一个sandbox
    "para": 5,
    "testfirst": test_first,
    "testsecond": test_second,
    "testthird": test_third
}


def test_eval():
    condition = "para == 5 and testsecond(testfirst()) > 5"
    res = eval(condition, action)  # 解释condition并根据action对应的动作执行
    print(res)


# 11. exec
def test_exec():
    exec("testthird()", action)


# 12. getattr
class TestGetAttr(object):
    test = "test attribute"

    def say(self):
        print("test method")

    def default(self):
        print("default methhod")


def test_getattr():
    my_test = TestGetAttr()
    # if no default argument, raising AttributeError
    getattr(my_test, "say1", my_test.default)()


# 13. csv
def read_csv():
    with open('data.csv') as f:
        reader = csv.reader(f, delimiter=',', quotechar='|')
        for row in reader:
            print(', '.join(row))


def read_csv_dict():
    with open('data.csv') as f:
        reader = csv.DictReader(f)
        for row in reader:
            print(row['name'], row['address'], row['age'])


def write_csv():
    with open('data.csv', 'w', newline='') as f:
        writer = csv.writer(f, delimiter=',',
                            quotechar='|', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(['name', 'address', 'age'])  # 单行写入
        data = [('xiaoming', 'china', '10'), ('Lily', 'USA', '12')]
        writer.writerows(data)  # 多行写入


def write_csv_dict():
    with open('data.csv', 'w', newline='') as csvfile:
        fieldnames = ['name', 'address', 'age']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

        writer.writeheader()
        writer.writerow({'name': 'Baked', 'address': 'China', 'age': 10})
        writer.writerow({'name': 'Lovely', 'address': 'USA', 'age': 11})
        writer.writerow({'name': 'Wonderful', 'address': 'Japan', 'age': 12})


def main():
    # try:
    #     test_with()
    # except Exception:
    #     print("Catch Exception in main")

    # test_filter()
    # one_line_if()

    # t1 = Test()
    # t2 = Test()
    # print(t1, t2)  # 两者具有相同的地址

    # test_three_method()
    # test_iter()
    # test_partial()
    # test_eval()
    # test_exec()
    # test_getattr()

    write_csv()
    read_csv()
    # write_csv_dict()
    # read_csv_dict()


if __name__ == '__main__':
    main()
