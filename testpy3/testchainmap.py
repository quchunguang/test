# https://pymotw.com/3/collections/chainmap.html
import collections

a = {'a': 'A', 'c': 'C'}
b = {'b': 'B', 'c': 'D'}

m = collections.ChainMap(a, b)

print('Individual Values')
print('a = {}'.format(m['a']))
print('b = {}'.format(m['b']))
print('c = {}'.format(m['c']))
print()

print('Keys = {}'.format(list(m.keys())))
print('Values = {}'.format(list(m.values())))
print()

print('Items:')
for k, v in m.items():
    print('{} = {}'.format(k, v))
print()

print('"d" in m: {}'.format(('d' in m)))


# reverse the list
m.maps = list(reversed(m.maps))
print('c = {}'.format(m['c']))

# update values
b['c'] = 'E'
print('c = {}'.format(m['c']))
m['c'] = 'F'
print('c = {}'.format(m['c']))
print('c = {}'.format(a['c']))

# This stacking behavior is what makes it convenient to use ChainMap instances
# as template or application contexts, since it is easy to add or update
# values in one iteration, then discard the changes for the next iteration.
m2 = m.new_child()
print('m2 before:', m2)
m2['c'] = 'E'
print('m2 before:', m2)
