import numpy as np
import matplotlib.pyplot as plt

p = 0.03
q = 0.08
r = 0.03
k = 0.001
X = np.arange(0., 1., k)

S, S1, S2 = np.sin(X * 2), np.zeros(len(X)), np.ones(len(X))

theta = np.arctan(2. * r / q)
tmp = q / 2. + p
l = np.hypot(tmp, r)


def calc_n(m):
    for x, s in zip(X, S):
        if x > m[0] and np.hypot(x, s) >= q:
            return (x, s)
    return (0, 0)


def calc_abcd(o, g):
    a = (o[0] - l * np.cos(theta - g), o[1] + l * np.sin(theta - g))
    b = (o[0] + l * np.cos(theta + g), o[1] + l * np.sin(theta + g))
    c = (o[0] + l * np.cos(theta - g), o[1] - l * np.sin(theta - g))
    d = (o[0] - l * np.cos(theta + g), o[1] - l * np.sin(theta + g))
    return a, b, c, d


for x, s in zip(X, S):
    m = (x, s)
    n = calc_n(m)
    o = ((m[0] + n[0]) / 2., (m[1] + n[1]) / 2.)
    a, b, c, d = calc_abcd(o, np.arctan((n[1] - m[1]) / (n[0] - m[0])))

    if a[0] >= 0 and a[0] < 1. and a[1] > S1[int(a[0] / k)]:
        S1[int(a[0] / k)] = a[1]

    if b[0] >= 0 and b[0] < 1. and b[1] > S1[int(a[0] / k)]:
        S1[int(b[0] / k)] = b[1]

    if c[0] >= 0 and c[0] < 1. and c[1] < S2[int(c[0] / k)]:
        S2[int(c[0] / k)] = c[1]

    if d[0] >= 0 and d[0] < 1. and d[1] < S2[int(d[0] / k)]:
        S2[int(d[0] / k)] = d[1]


s1, s2 = S1[90], S2[90]
for i in range(91, len(X)):
    if np.abs(S1[i] - s1) > 0.1:
        S1[i] = s1
    if np.abs(S2[i] - s2) > 0.1:
        S2[i] = s2
    s1, s2 = S1[i], S2[i]

# with open("foo.csv", "w") as f:
#     for i in range(0, len(X)):
#         f.write(str(S[i]) + "," + str(S1[i]) + "," + str(S2[i]) + "\n")

plt.plot(X, S)
plt.plot(X, S1)
plt.plot(X, S2)

plt.show()
