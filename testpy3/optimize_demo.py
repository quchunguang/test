import numpy as np
from scipy import optimize


def f(x):
    return -np.exp(-(x - .7)**2)


x_min = optimize.brent(f)
print(x_min, x_min - .7)
