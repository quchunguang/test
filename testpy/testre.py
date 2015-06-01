'''
Created on 2012-12-26

@author: qcg
'''
import re


def main():
    pattern = re.compile(r'hello')
    match = pattern.match('hello world')  # must match from start pos
    match2 = re.match(r'hello', 'hello world')
    if match:
        print match.group()
        print match2.group()

    pattern2 = re.compile(r'world')
    search = pattern2.search('hello world, hello world!')
    print search.group()

    p = re.compile(r'\d+')
    print p.split('one1two2three3four4')
    print p.findall('one1two2three3four4')
    for m in p.finditer('one1two2three3four4'):
        print m.group(),

    p = re.compile(r'(\w+) (\w+)')
    s = 'i say, hello world!'
    print p.sub(r'\2-\1', s)
    print p.subn(r'\2-\1', s)

    def func(m):
        return m.group(1).title() + '=' + m.group(2).title()
    print p.sub(func, s)
    print p.subn(func, s)

if __name__ == "__main__":
    main()
