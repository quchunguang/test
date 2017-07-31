import numpy as np
from matplotlib import pyplot as plt
from scipy.special import bdtr
from scipy.interpolate import interp1d


# a = range(10000000)
# b = range(10000000)
# c = []
# for i in range(len(a)):
#     c.append(a[i] + b[i])

# a = np.arange(10000000)
# b = np.arange(10000000)
# c = a + b

p = np.poly1d([3, 4, 5])
print(p)
print(p * p)


def addsubtract(a, b):
    if a > b:
        return a - b
    else:
        return a + b

vec_addsubtract = np.vectorize(addsubtract)
r = vec_addsubtract([0, 3, 6, 9], [1, 3, 5, 7])
print(r)

np.cast['f'](np.pi)

x = np.r_[-2:3]
y = np.select([x > 3, x >= 0], [0, x + 2])
print(y)

print(bdtr(-1, 10, 0.3))


# 1-D interpolation (interp1d)
x = np.linspace(0, 10, num=11, endpoint=True)
y = np.cos(-x**2 / 9.0)
f = interp1d(x, y)
f2 = interp1d(x, y, kind='cubic')

xnew = np.linspace(0, 10, num=41, endpoint=True)
plt.plot(x, y, 'o', xnew, f(xnew), '-', xnew, f2(xnew), '--')
plt.legend(['data', 'linear', 'cubic'], loc='best')
plt.show()
