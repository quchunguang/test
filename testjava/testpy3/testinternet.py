'''
Created on 2013-1-19

@author: Administrator
'''
import urllib.request
import smtplib

for line in urllib.request.urlopen('http://www.baidu.com'):
    line = line.decode('gb2312')
    print(line)

server = smtplib.SMTP('localhost')
server.sendmail('quchunguang@example.org', 'quchunguang@gmail.com',
"""To: quchunguang@example.org
From: quchunguang@gmail.com
Beware the Ides of March.
""")
server.quit()