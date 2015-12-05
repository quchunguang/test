"""
http://www.geoinformatics.cn/lab/pyquery/
http://blog.csdn.net/cnmilan/article/details/8727308
"""
import subprocess
from pyquery import PyQuery as pq

def main():
    """
    Scratch repos list from github (not using github API).
    """
    url = "https://github.com/IronSummitMedia?page="

    args = ""
    for i in range(1, 3):
        dom = pq(url=url+str(i))
        # for i in d('.repo-list-name a'):
        #     print pq(i).text()
        args += dom('.repo-list-name a').text()
        args += " "

    cmdline = "for i in " + args + "; do echo $i; done"
    subprocess.call(cmdline, shell=True)


if __name__ == '__main__':
    main()
