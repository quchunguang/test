# coding: utf-8
import urllib2
import json
import socket


def readJson(filename):
    """
    Get data from JSON file
    """
    fp = open(filename, "r")
    obj = json.load(fp, encoding='utf-8', )
    fp.close()
    return obj


def writeJson(filename, obj):
    """
    Write out data to JSON file.

    BUG of python: Argument encoding='utf-8'json.dump()/json.dumps() seems not
    work. Here using json.dumps() and fp.write(s.encode('utf-8')) instead.
    """
    fp = open(filename, "w")
    s = json.dumps(obj, fp,
                   indent=4,
                   sort_keys=True,
                   ensure_ascii=False)
    fp.write(s.encode('utf-8'))
    fp.close()


def main():
    obj = {"a": u"测试"}
    writeJson("testjsonchinese.json", obj)
    obj2 = readJson("testjsonchinese.json")
    print obj2

if __name__ == '__main__':
    main()
