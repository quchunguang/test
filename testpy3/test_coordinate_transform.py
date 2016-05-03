""" Coordinate transform demo

    pip install numpy scipy matplotlab
    http://scipy.github.io/old-wiki/pages/NumPy_for_Matlab_Users.html
"""
import numpy as np
import matplotlib.pyplot as plt


def rotate(X, O, t):
    """ Rotate 2-dim points X with t angle round point O
    """
    M = np.tile(O, (len(X), 1))
    T = X - M
    R = np.array([[np.cos(t), np.sin(t)],
                  [-np.sin(t), np.cos(t)]])
    return np.dot(T, R) + M


def main():
    X = np.array([[1, 0],
                  [0, 1],
                  [-1, 0],
                  [0, -1]])
    O = np.array([1, 1])
    t = np.pi / 4
    Y = rotate(X, O, t)

    plt.plot(*zip(*X), "bs", *zip(*Y), "g^")
    plt.show()


if __name__ == '__main__':
    main()
