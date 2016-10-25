""" The "right" usage of getter/setter

    In class `Circle`, `self.edge` is the origin data, so it SHOULD be access directly. the `area`, are not a data holding directly by the object. But it related with the origin data `self.edge`. If we want the user to access `area` just like the origin data, only when we need getter/setter.

    Another usage of getter, is protect a data to be read only after the object created. `color` is used as a read only property with getter.
"""
import numpy as np


class Circle(object):
    def __init__(self, edge, color):
        self.edge = edge
        self._color = color

    @classmethod
    def e(cls):
        return np.e

    @staticmethod
    def pi():
        return np.pi

    @property
    def area(self):
        return self.edge ** 2

    @area.setter
    def area(self, area):
        self.edge = area ** 0.5

    @property
    def color(self):
        return self._color

    @color.deleter
    def color(self):
        self._color = "write"


def main():
    c = Circle(5, "red")
    print(Circle.e())   # class method, with a `cls` argument instead of `self`
    print(c.e())        # also can be call from object
    print(Circle.pi())  # static method is just a normal function like outside
    print(c.pi())       # static method is just a normal function like outside
    print(c.area)       # getter
    c.area = 7          # setter
    print(c.edge)       # getter

    # c.color = "blue"    # error: read only
    print(c.color)      # get read only color
    # With prefix "_" tells user not to access it outside, but not forced.
    # c._color = "blue"

    del c.color         # deleter invoke
    print(c.color)

if __name__ == '__main__':
    main()
