#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from pymongo import MongoClient, DESCENDING

client = MongoClient()
test = client.test
user = test.user

# mydb = con.mydb # new a database
# mydb.add_user('test', 'test') # add a user
# mydb.authenticate('test', 'test') # check auth

# insert data
# for i in range(10):
#     user.insert({'id': i, 'name': 'qcg' + str(i)})
# user.insert({'id': 10, 'name': '一个名字'})
# user.insert([
#     {'id': 11, 'name': '名字1'},
#     {'id': 12, 'name': '名字2'},
#     ])
# drop data
# user.drop()
# user.remove({'id':1}) # delet records where id = 1

# update data
# user.update({'id':10}, {'$set':{'name':'两个名字'}}) # update one record

# create index
# user.create_index('id')

# query data
print '''user.find_ one()['name']:''', user.find_one()['name']
print '''user.find({'id': 0}).count():''', user.find({'id': 0}).count()
query1 = {'id': { '$in': [1,2,3,4,5,6,] }}
query2 = {'id': { '$lt': 8 }}
for record in user.find():
# for record in user.find(query).sort('id', DESCENDING).limit(3):
    print 'id:', record['id'], '\tname:', record['name'].encode('utf8')
print 'user.count():', user.count()
