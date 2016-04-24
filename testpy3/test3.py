'''
Created on 2013-1-16

@author: Administrator
'''
import time
import logging
import html

# test iterator
x = [0, 1, 2, 3, 4]
print([i * 10 for i in x if i <= 3])
print(list(filter(lambda i: i % 2 == 0, x)))
l = list(map(lambda i: i * 2, x))

s = '0;1;2;3;4;5;6'
t = s.split(";")
print(t[:-2])

addrs = {"quchunguang": "quchuguang@gmail.com",
         "ynn": "ynn@gmail.com", }
print(addrs["ynn"])
print('Py' in 'sPython')
print("The number of 1+2 is {0}".format(1 + 2))

print(time.asctime())
print(time.strftime("%Y-%m-%d %H:%M:%S"))

logging.basicConfig(filename='test3.log',
                    level=logging.DEBUG,
                    format='%(asctime)s [%(levelname)s] %(message)s')
logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')

# passwd = getpass.getpass()
# print(passwd)
print(html.escape("fds''fk%^&*&"))
