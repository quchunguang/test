import numpy as np

x = np.array([1, 2, 4, 7, 11, 16], dtype=np.float)
dx = np.gradient(x)
dx = np.gradient(x, 2)

print(dx)
