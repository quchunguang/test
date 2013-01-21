'''
Created on 2013-1-17

@author: Administrator
'''
import sqlite3


conn = sqlite3.connect("d:\\mydoc\\test.db")
c=conn.cursor()
#c.execute('''create table test (name text, value real)''')
#c.execute('''insert into test values ('qq', 300)''')
#conn.commit()
c.execute("select * from test")
for name,value in c:
    print(name)
c.close()
