# The standard dictionary includes the method setdefault() for retrieving a
# value and establishing a default if the value does not exist. By contrast,
# defaultdict lets the caller specify the default up front when the container
# is initialized.
import collections

# setdefault() in dict built-in
d = {'a': 1, 'b': 2}
d.setdefault('c', 1)  # add key with value only if the key not exist
print(d.keys())


# initialize
d = collections.defaultdict(lambda: 'default value', foo='foo')
# d = collections.defaultdict(str)
print('d:', d)
print('foo =>', d['foo'])
print('bar =>', d['bar'])  # d['bar'] inserted when access
print(d)

d = {'foo': 'foo'}
print(d.get('bar', 'default value'))  # d['bar'] not exist after access
print(d)
