import numpy as np
from matplotlib import pyplot as plt
import scipy

a = np.zeros(1000)
a[:100] = 1.
b = scipy.fft(a)
f = np.arange(-500, 500, 1)
plt.grid(True)
plt.plot(f, abs(np.concatenate((b[500:], b[:500]))))
plt.show()
