from pymongo import MongoClient, DESCENDING

client = MongoClient()
test = client.test
# testData = test.testData
# for i in testData.find():
# print(i)
# print(testData.find_one()['name'])

# mydb = con.mydb # new a database
# mydb.add_user('test', 'test') # add a user
# mydb.authenticate('test', 'test') # check auth

# user = test.user
# for i in range(10):
#     user.insert({'id': i, 'name': 'qcg' + str(i)})


# print(user.find({'id': 0}).count())
# user.create_index('id')
# for record in user.find().sort('id', DESCENDING):
#     print(record)

# print(user.count())

# muser.drop() delete table
# user.remove({'id':1}) # delet records where id = 1
# user.update({'id':2}, {'$set':{'name':'haha'}}) # update one recor

# import json
# data = json.dumps({'bar': 'baz'})
# compdata = test.compdata
# compdata.insert(data)
# bunk = test.bunk
# bulk = bunk.initialize_ordered_bulk_op()

# blog = test.blog
# import datetime
# post = {"author": "Mike",
#         "text": "My first blog post!",
#         "tags": ("mongodb", "python", "pymongo"),
#         "date": datetime.datetime.utcnow()}
# blog.insert(post)


# print test.collection_names(False)
# test.drop_collection('user')
# map(test.drop_collection, test.collection_names(False))
# client.drop_database('test')
# print client.database_names()

# import pickle
# import json
# from bson.binary import Binary
# class Student():
#     def __init__(self, name, x1, y1, x2, y2):
#         self.name = name
#         self.x1 = x1
#         self.y1 = y1
#         self.x2 = x2
#         self.y2 = y2

# s1 = Student('Qu', 0, 0, 5, 5)
# out = pickle.dumps(s1, protocol=2)
# obj = test.obj
# obj.insert({s1.name: Binary(out)})
# obj.insert({"2" : ['foo', {'bar': ('baz', None, 1.0, 2)}]})

