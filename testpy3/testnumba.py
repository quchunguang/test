# https://jakevdp.github.io/blog/2015/02/24/optimizing-python-with-numpy-and-numba/
#
# download Anaconda3 https://www.continuum.io/downloads by
# wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh
# bash Anaconda3-4.0.0-Linux-x86_64.sh
# cat >>~/.bashrc <<_END
# export PATH="/home/qcg/local/anaconda3/bin:$PATH"
# _END
# source ~/.bashrc
# conda install numba
# python3 testnumba.py
#
# jit decorator tells Numba to compile this function.
# The argument types will be inferred by Numba when function is called.
from numba import jit
from numpy import arange


@jit
def sum2d(arr):
    M, N = arr.shape
    result = 0.0
    for i in range(M):
        for j in range(N):
            result += arr[i, j]
    return result

a = arange(9).reshape(3, 3)
print(sum2d(a))
