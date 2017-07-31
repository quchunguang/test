""" Find local max values of an array"""
import numpy as np
import matplotlib.pyplot as plt

# extend two min values on both sides, here's 0.
# suggest no two neighbor local max values are equal.
l = np.array([0., 0.1, 0.2, 0.3, 0.1, 0.6, 0.7, 0.5, 0.2, 0.1, 0.])
c = l[:-1] < l[1:]
ret = c[:-1] & ~c[1:]
print(ret)

plt.plot(l, 'o-')
plt.show()
