'''
Created on 2013-1-17

@author: quchunguang@gmail.com
'''
import locale


# options
_LANGUAGE = ""
_MESSAGES = {
    "en" : {
        "hello" : "Hello World!",
        "bye" : "Good bye!",
    },
    "zh_CN" : {
        "hello" : "世界，你好!",
        "bye" : "再见!",
    },
}
def getMessage(key):
    """It read system locale if _LANGUAGE is not set. English will be used if language not found."""
    locallang = locale.getdefaultlocale()[0]
    print(locallang)
    if _LANGUAGE in _MESSAGES:
        lang = _LANGUAGE
    elif locallang in _MESSAGES:
        lang = locallang
    else:
        lang = "en"
    return _MESSAGES[lang][key]
_ = getMessage

# usage
print(_("hello"))
