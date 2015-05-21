import sys
from distutils.core import setup
import py2exe

sys.argv.append('py2exe')
setup(console=['hello.py'])
