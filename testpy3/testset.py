class MyObj():

    """docstring for MyObj"""

    def __init__(self, name, age):
        super(MyObj, self).__init__()
        self.name = name
        self.age = age

    def __eq__(self, other):
        return self.name == other.name

    def __hash__(self):
        return hash(self.name)

o1 = MyObj("Been", 32)
o2 = MyObj("John", 22)
o2d = MyObj("John", 22)
o3 = MyObj("Kevin", 12)
o3d = MyObj("Kevin", 12)
o4 = MyObj("Lone", 42)

s1 = {o1, o2, o3}
s2 = {o2d, o3d, o4}

print(s1 & s2)
