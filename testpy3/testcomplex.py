import numpy as np


def complex_mat():
    x = 1 + 2 * 1j
    # C = np.zeros((2, 2), dtype=np.complex_)
    C = np.zeros((2, 2), dtype=complex)
    C[0, 0] = 1 + 1j + x
    D = np.dot(C, C)
    print(D)


def matrix():
    I = np.eye(3)
    I[1, 1] = 0
    print(np.linalg.matrix_rank(I))


def solve():
    A = np.array([[2, -1], [-1, 2]])
    b = np.array([[0], [3]])
    x = np.linalg.solve(A, b)
    # x = np.linalg.inv(A).dot(b)  # equal, but slow
    print(x)
    print(np.linalg.det(A))
    print(np.linalg.norm(A))
    print(np.linalg.eig(A))


def main():
    solve()


if __name__ == '__main__':
    main()
