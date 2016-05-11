import heapq as hq
import random


def heapsort(iterable):
    h = []
    for value in iterable:
        hq.heappush(h, value)
    return [hq.heappop(h) for i in range(len(h))]


h = []
hq.heappush(h, (5, 'write code'))
hq.heappush(h, (7, 'release product'))
hq.heappush(h, (1, 'write spec'))
u = hq.heappushpop(h, (3, 'create tests'))
print("pushpop", u)

while len(h) > 0:
    print(hq.heappop(h))

print(hq.nsmallest(3, [5, 1, 6, 3, 9]))

x = list(range(5)).sort()
y = sorted(range(5))
print(y)

ls = [sorted(random.sample(range(50), 10)) for i in range(5)]  # must be sorted
for i in hq.merge(*ls):  # return an iterator instead of list
    print(i, end=' ')
print()

h2 = random.sample(range(50), 10) # create heap from list
hq.heapify(h2)
print(h2)
