#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb


class mysqldb():
    def __init__(self):
        self.conn = MySQLdb.connect(host='localhost', user='root', passwd='passwd')
        self.cursor = self.conn.cursor()

    def createdb(self):
        self.cursor.execute("""create database if not exists test""")
        self.conn.select_db('test')
        self.cursor.execute("""create table testpy(id int, info varchar(100)) """)

    def insertdb(self):
        value = [-1, "inserted"]
        self.cursor.execute("""insert into testpy values(%s,%s)""", value)
        values = []
        for i in range(20):
            values.append((i, 'Hello mysqldb, I am recoder ' + str(i)))
        self.cursor.executemany("""insert into testpy values(%s,%s)""", values)

    def delete(self):
        self.conn.select_db('test')
        self.cursor.execute("""delete from testpy where id=-1""")

    def select(self):
        self.conn.select_db('test')
        self.cursor.execute("""select id, info from testpy""")
        print """<table id="box-table-a" summary="mysql.test.testpy">
<thead><tr>
<th scope="col">id</th>
<th scope="col">info</th>
</tr></thead>
<tbody>"""
        for testpy_id, testpy_info in self.cursor.fetchall():
            print """<tr><td>""", testpy_id, \
                """</td><td>""", testpy_info, \
                """</td></tr>"""
        print """</tbody></table>"""

    def __del__(self):
        self.cursor.close()
        self.conn.commit()
        self.conn.close()

def main():
    obj = mysqldb()
    obj.select()
    del obj

if __name__ == "__main__":
    main()