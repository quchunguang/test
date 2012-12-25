#!/usr/bin/env python2
# -*- coding=utf-8 -*-
import MySQLdb


class mysqldb():
    def __init__(self):
        self.conn = MySQLdb.connect(host='localhost', user='root', passwd='passwd')
        self.cursor = self.conn.cursor()

    def createdb(self):
        """docstring for createdb"""
        self.cursor.execute("""create database if not exists test""")
        self.conn.select_db('test')
        self.cursor.execute("""create table testpy(id int, info varchar(100)) """)

    def insertdb(self):
        """docstring for insertdb"""
        value = [-1, "inserted"]
        self.cursor.execute("""insert into testpy values(%s,%s)""", value)
        values = []
        for i in range(20):
            values.append((i, 'Hello mysqldb, I am recoder ' + str(i)))
        self.cursor.executemany("""insert into testpy values(%s,%s)""", values)

    def select(self):
        """docstring for select"""
        self.conn.select_db('test')
        self.cursor.execute("""select id, info from testpy""")
        #for testpy_id, testpy_info in self.cursor.fetchall():
        result = self.cursor.fetchmany(4)
        while result:
            for testpy_id, testpy_info in result:
                print testpy_id, " => ", testpy_info
            result = self.cursor.fetchmany(4)
            print "------------NEXT PAGE----------------"

    def __del__(self):
        self.cursor.close()
        self.conn.commit()
        self.conn.close()


def main():
    """docstring for main """
    obj = mysqldb()
    #obj.createdb()
    #obj.insertdb()
    obj.select()
    del obj

if __name__ == "__main__":
    main()
