# https://pymotw.com/3/queue/index.html
# Sometimes the processing order of the items in a queue needs to be based on
# characteristics of those items, rather than just the order they are created
# or added to the queue. For example, print jobs from the payroll department
# may take precedence over a code listing printed by a developer.PriorityQueue
# uses the sort order of the contents of the queue to decide which to retrieve.
import functools
import queue
import threading


@functools.total_ordering
class Job:

    def __init__(self, priority, description):
        self.priority = priority
        self.description = description
        print('New job:', description)
        return

    def __eq__(self, other):
        try:
            return self.priority == other.priority
        except AttributeError:
            return NotImplemented

    def __lt__(self, other):
        try:
            return self.priority < other.priority
        except AttributeError:
            return NotImplemented


q = queue.PriorityQueue()

q.put(Job(3, 'Mid-level job 1'))
q.put(Job(10, 'Low-level job 2'))
q.put(Job(1, 'Important job 3'))


def process_job(q, worker_name):
    while True:
        next_job = q.get()
        print(worker_name, 'Processing', next_job.description)
        q.task_done()


workers = [
    threading.Thread(target=process_job, args=(q, "Worker 1")),
    threading.Thread(target=process_job, args=(q, "Worker 2")),
]
for w in workers:
    w.setDaemon(True)
    w.start()

q.join()
