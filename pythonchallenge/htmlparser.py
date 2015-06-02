from html.parser import HTMLParser
from urllib.request import urlopen

'''
HTMLParser的成员函数:

    handle_startendtag  处理开始标签和结束标签
    handle_starttag     处理开始标签，比如<xx>
    handle_endtag       处理结束标签，比如</xx>
    handle_charref      处理特殊字符串，就是以&#开头的，一般是内码表示的字符
    handle_entityref    处理一些特殊字符，以&开头的，比如
    handle_data         处理数据，就是<xx>data</xx>中间的那些数据
    handle_comment      处理注释
    handle_decl         处理<!开头的，比如<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    handle_pi           处理形如<?instruction>的东西

'''


class myHtmlParser(HTMLParser):

    comment = []

    def handle_comment(self, comment):
        # print 'Encounter some comments:' + comment
        self.comment.append(comment)


if __name__ == '__main__':
    m = myHtmlParser()
    url = 'http://www.pythonchallenge.com/pc/def/ocr.html'
    data = urlopen(url).read().decode('utf-8')
    m.feed(data)
    m.close()
    data = m.comment[1]
    print(''.join(filter(str.isalpha, data)))
