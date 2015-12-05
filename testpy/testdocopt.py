"""testdocopt is a demo of using docopt package.

Usage:
  testdocopt.py ship new <name>...
  testdocopt.py ship <name> move <x> <y> [--speed=<kn>]
  testdocopt.py ship shoot <x> <y>
  testdocopt.py mine (set|remove) <x> <y> [--moored | --drifting]
  testdocopt.py (-h | --help)
  testdocopt.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  --speed=<kn>  Speed in knots [default: 10].
  --moored      Moored (anchored) mine.
  --drifting    Drifting mine.

"""
from docopt import docopt

# https://github.com/docopt/docopt/tree/master/examples
if __name__ == '__main__':
    arguments = docopt(__doc__, version='Naval Fate 2.0')
    print(arguments)
