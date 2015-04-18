#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# Function: A robot of save bbs ticket to plain text format
# Environment: phpwind 8.7 (test on http://bbs.sanww.com)
# Run: ./robot_bbs.py tid
# Example: Access http://bbs.sanww.com/read.php?tid-109315.html
#          $ ./robot_bbs.py 109315 > 109315.txt
import sys
import urllib
import re

pages = 0


def processpage(filehandle, pagenumber):
    global pages
    start = False
    nocontent = True
    for line in filehandle.readlines():
        lined = line.decode('gb18030')

        # page check
        if pages == 0 and ur'<span class="pages">' in lined:
            if ur'返回列表</a></span><span class="fl"></span></div>' in lined:
                pages = 1
                continue
            if ur'</a></div></span></div>' in lined:
                m = re.search(ur'\.html">(\d+)</a></div></span></div>', lined)
                if m:
                    pages = int(m.group(1))
                    continue
            m = re.search(ur'var page=\(value>(\d+)\)', lined)
            if m:
                pages = int(m.group(1))
                continue

        # title check
        if pagenumber == 1:
            m = re.match(ur'<title>(.*)</title>', lined)
            if m:
                title = m.group(1)
                title = title.replace(u"|图文区 - 三文论坛", u"")
                print u'标题: ' + title
                continue

        # author check
        m = re.match(r'<a href="u.php\?uid=[0-9]+">(.*)</a>', lined)
        if m:
            print u'作者: ' + m.group(1)
            continue

        # content check
        if re.match(r'<div class="f14 mb10" id="read_.*">', lined):
            start = True
            print u'内容:',
            continue
        if start and re.match(r'</div>', lined):
            start = False
            if nocontent:
                print
                print
            else:
                nocontent = True
            continue
        if start:
            content = lined.replace(ur"<br />", "\n")  # generate newline
            content = re.sub(ur"<.*?>", u"", content)  # trim html labels
            content = re.sub(ur"&.*?;", u"", content)  # trim special char
            content = re.sub(ur"=700\).*?>", u"\n      ", content)  # ??
            content = content.replace(ur"[表情] ", u"")  # trim monkeys
            content = content.replace(ur'700)this.width=700;" >', u"")  # ??
            content = re.sub(ur"图片:(.*?).jpg", u"", content)  # trim images
            content = re.sub(ur"\n\s*\n*", "\n", content)  # trim newlines
            if content == "\n":
                continue
            print content
            nocontent = False


def main():
    global pages
    reload(sys)
    sys.setdefaultencoding("utf-8")

    tid = sys.argv[1]
    pagemark = ""
    pagenumber = 1
    while True:
        url = "http://bbs.sanww.com/read.php?tid-" + tid + pagemark + ".html"
        filehandle = urllib.urlopen(url)
        if filehandle.getcode() != 200:
            filehandle.close()
            print '[ERROR] Bad url. Abort.'
            break

        processpage(filehandle, pagenumber)
        filehandle.close()

        pagenumber += 1
        if pagenumber > pages:
            break
        pagemark = "-page-" + str(pagenumber)


if __name__ == "__main__":
    main()
