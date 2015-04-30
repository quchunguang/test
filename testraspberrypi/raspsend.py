#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
'''
Function:
    Send Weibo of Sina
Dependence:
    $ sudo apt-get install pip
    $ sudo pip install sinaweibopy
    raspsend.ini with section "Auth" with APP_KEY, APP_SECRET, CALL_BACK, ACCESS_TOKEN, EXPIRES_IN
Usage:
    $ ./$PROGNAME -m "message contents to be sent"  # send a message
    $ ./$PROGNAME -a                                # update authorize info
'''
import weibo
import ConfigParser
import sys
import webbrowser


def auth():
    '''
    授权需要的三个信息，APP_KEY、APP_SECRET为创建应用时分配的，CALL_BACK在应用的
    设置网页中设置的。注意这里授权时使用的CALL_BACK地址与应用中设置的CALL_BACK必
    须一致，否则会出现redirect_uri_mismatch的错误。weibo模块的APIClient是进行授
    权、API操作的类，先定义一个该类对象，传入参数为APP_KEY, APP_SECRET, CALL_BACK
    获取该应用（APP_KEY是唯一的）提供给用户进行授权的url输入该code值通过该code获取
    access_token，r是返回的授权结果，具体参数参考官方文档：
    http://open.weibo.com/wiki/Oauth2/access_token
    '''
    cfg = ConfigParser.ConfigParser()
    cfg.read("raspsend.ini")
    section = "Auth"
    app_key = cfg.get(section, "APP_KEY")
    app_secret = cfg.get(section, "APP_SECRET")
    call_back = cfg.get(section, "CALL_BACK")
    access_token = cfg.get(section, "ACCESS_TOKEN")
    expirs_in = cfg.get(section, "EXPIRES_IN")

    client = weibo.APIClient(app_key, app_secret, call_back)

    # 将access_token和expire_in设置到client对象
    client.set_access_token(access_token, expirs_in)
    return client


def send_msg(content):
    ''' send a message to Sina Weibo'''
    client = auth()
    # 调用接口发一条新微薄，status参数就是微博内容
    client.statuses.update.post(status=content)


def update_auth():
    ''' get a new pair of access_token and expires and write to ini'''
    cfg = ConfigParser.ConfigParser()
    cfg.read("raspsend.ini")
    section = "Auth"
    app_key = cfg.get(section, "APP_KEY")
    app_secret = cfg.get(section, "APP_SECRET")
    call_back = cfg.get(section, "CALL_BACK")
    client = weibo.APIClient(app_key, app_secret, call_back)

    auth_url = client.get_authorize_url()
    webbrowser.open_new(auth_url)
    code = raw_input("input the retured code : ")
    r = client.request_access_token(code)

    cfg.set(section, "ACCESS_TOKEN", r.access_token)
    cfg.set(section, "EXPIRES_IN", r.expires_in)
    f = open('raspsend.ini', 'w')
    cfg.write(f)
    f.close()


def main():
    if sys.argv[1] == '-m' and sys.argv[2]:
        send_msg(sys.argv[2])
    elif sys.argv[1] == '-a':
        update_auth()

if __name__ == "__main__":
    main()
