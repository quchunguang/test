class B():

    def __call__(self, name):
        return getattr(self, name)

    def a(self, text):
        print('a' + text)

    def b(self, text):
        print('b' + text)


class A():

    def __getattr__(self, name):
        bb = B()
        return bb(name)

aa = A()
aa.a('aaaa')
aa.b('bbbb')
