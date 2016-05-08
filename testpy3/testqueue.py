# queue
# Thread-safe FIFO Implementation
# https://pymotw.com/3/queue/index.html
import queue

# FIFO
q = queue.Queue()

for i in range(5):
    q.put(i)

while not q.empty():
    print(q.get(), end=' ')
print()


# LIFO
q = queue.LifoQueue()

for i in range(5):
    q.put(i)

while not q.empty():
    print(q.get(), end=' ')
print()

# Priority Queue
