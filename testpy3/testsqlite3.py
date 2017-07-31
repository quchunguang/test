"""
Created on 2013-1-17

@author: Administrator
"""
from sqlite3 import connect, register_adapter, register_converter, \
    PARSE_DECLTYPES
from datetime import datetime
import time


class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y

    def __repr__(self):
        return "(%f; %f)" % (self.x, self.y)

    @classmethod
    def frombytes(cls, bs):
        return cls(*list(map(float, bs.split(b";"))))

    @classmethod
    def tobytes(cls, o):
        return ("%f;%f" % (o.x, o.y))


register_adapter(Point, Point.tobytes)
register_converter("point", Point.frombytes)
register_adapter(datetime, lambda v: time.mktime(v.timetuple()))
register_converter("datetime", lambda v: datetime.fromtimestamp(float(v)))

# conn = sqlite3.connect(":memory:")
conn = connect("foo.sqlite3", detect_types=PARSE_DECLTYPES)
c = conn.cursor()

c.execute('''drop table if exists test''')
c.execute('''drop table if exists geo''')
c.execute('''create table test(name text, value real)''')
c.execute('''create table geo(loc point, time datetime)''')

data = [('aaa', 1), ('bbb', 2)]
p = Point(4.0, -3.2)
now = datetime.now()
c.executemany('''insert into test values (?, ?)''', data)
c.execute('''insert into test(name, value) values ('ccc', 3)''')
c.execute('''insert into geo(loc, time) values (?, ?)''', (p, now))
conn.commit()

c.execute("select * from test")
for name, value in c:
    print(name + " => " + str(value))
c.execute("select loc, time from geo")
one = c.fetchone()
print(one)

c.close()
