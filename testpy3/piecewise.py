import numpy as np
x = np.arange(10)

# x < 3 means [i < 3 for i in x]
x2 = np.where(x < 3, -x, 0)
# x2 = np.array([-i if i < 3 else 0 for i in x])
print(x, x2)

x3 = np.select([x < 3, x < 7, True], [-x, 0, x])
print(x, x3)

# (x >= 3) & (x < 7) means [i < 3 && i < 7 for i in x]
x4 = np.piecewise(x,
                  [x < 3, (x >= 3) & (x < 7), x >= 7],
                  [lambda x: -x, 0, lambda x: x])
print(x, x4)
