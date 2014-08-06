#!/usr/bin/python
# -*- coding=utf-8 -*-
# sudo apt-get install postfix
'''
Created on 2012-12-26

@author: qcg
'''
import smtplib

sender = 'quchunguang@gmail.com'
receivers = ['quchunguang@gmail.com']

message = """From: Kevin Q <quchunguang@gmail.com>
To: Kevin Q <quchunguang@gmail.com>
Subject: SMTP e-mail test

This is a test e-mail message.
"""

try:
    smtpObj = smtplib.SMTP('localhost')
    smtpObj.sendmail(sender, receivers, message)
    print "Successfully sent email"
except smtplib.SMTPException:
    print "Error: unable to send email"
