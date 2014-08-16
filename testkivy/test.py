#-*- coding:utf-8 -*-
import kivy
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.button import Button


class myApp(App):

    def build(self):
        # 创建一个Button实例
        btn = Button(text='Say Hello to ShowMuch.com', font_size=30)
        # 绑定点击事件。
        btn.bind(on_press=self.callback)
        return btn

    # 触发事件
    def callback(self, instance):
        print 'Hello ShowMuch.com'

if __name__ == '__main__':
    myApp().run()
