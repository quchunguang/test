
import os
import operator

line_list = ['  line 1\n', 'line 2  \n', 'line 3  \n']

# Generator expression -- returns iterator
stripped_iter = (line.strip() for line in line_list)

# List comprehension -- returns list
stripped_list = [line.strip() for line in line_list]

print(stripped_list)
for line in stripped_iter:
    print(line)


def generate_ints(N):
    for i in range(N):
        yield i

print(next(generate_ints(3)))

print('generater send()')


def counter(maximum):
    i = 0
    while i < maximum:
        val = (yield i)
        # If value provided, change counter
        if val is not None:
            i = val
        else:
            i += 1

it = counter(10)
print(next(it))
it.send(8)
print(next(it))

import itertools
itertools.count()
itertools.cycle([1, 2, 3, 4, 5])
itertools.repeat('abc')
itertools.chain(['a', 'b', 'c'], (1, 2, 3))
itertools.islice(range(10), 8)
itertools.tee(itertools.count())
itertools.starmap(os.path.join,
                  [('/bin', 'python'), ('/usr', 'bin', 'java'),
                   ('/usr', 'bin', 'perl'), ('/usr', 'bin', 'ruby')])
itertools.combinations([1, 2, 3, 4, 5], 2)
itertools.permutations([1, 2, 3, 4, 5], 2)
itertools.combinations_with_replacement([1, 2, 3, 4, 5], 2)
city_list = [('Decatur', 'AL'), ('Huntsville', 'AL'), ('Selma', 'AL'),
             ('Anchorage', 'AK'), ('Nome', 'AK'),
             ('Flagstaff', 'AZ'), ('Phoenix', 'AZ'), ('Tucson', 'AZ'),
             ...
             ]


def get_state(city_state):
    return city_state[1]

itertools.groupby(city_list, get_state)
itertools.accumulate([1, 2, 3, 4, 5])


import functools
product = functools.reduce(operator.mul, [1, 2, 3], 1)
