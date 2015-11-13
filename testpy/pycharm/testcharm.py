#!/usr/bin/env python2
# -*- encoding=utf8 -*-
import pymongo

def main():
    mongo = pymongo.MongoClient('127.0.0.1', 27017)
    users = mongo.snsrobot.users
    for user in users.find():
        print user
    print '你好'


if __name__ == '__main__':
    main()
