# -*- coding:utf-8 -*-

import os
import sys
import time

import pygame
from pygame.locals import *
from pygame.font import *


def show_text(surface_handle, pos, text, color,
              font_bold=False, font_size=20, font_italic=False):
    # 获取系统字体，并设置文字大小
    cur_font = pygame.font.Font("./方正黑体_GBK.TTF", font_size)

    # 设置是否加粗属性
    cur_font.set_bold(font_bold)

    # 设置是否斜体属性
    cur_font.set_italic(font_italic)

    # 设置文字内容
    text_fmt = cur_font.render(text, 1, color)

    # 绘制文字
    surface_handle.blit(text_fmt, pos)


def control_ball(event):
    # 相对偏移坐标
    speed = [x, y] = [0, 0]

    # 速度
    speed_offset = 4

    # 当方向键按下时，进行位置计算
    if event.type == pygame.KEYDOWN:
        if event.key == pygame.K_LEFT:
            speed[0] -= speed_offset
        if event.key == pygame.K_RIGHT:
            speed[0] = speed_offset
        if event.key == pygame.K_UP:
            speed[1] -= speed_offset
        if event.key == pygame.K_DOWN:
            speed[1] = speed_offset

    # 当方向键释放时，相对偏移为0，即不移动
    if event.type in (
            pygame.KEYUP, pygame.K_LEFT, pygame.K_RIGHT, pygame.K_DOWN):
        speed = [0, 0]

    return speed


def play_ball():
    pygame.init()

    # 窗口大小
    window_size = Rect(0, 0, 800, 600)

    # 设置窗口模式
    screen = pygame.display.set_mode(window_size.size)

    # 设置窗口标题
    pygame.display.set_caption('小蝴蝶')

    # 加载小球图片
    ball_image = pygame.image.load('butterfly.gif').convert()

    # 加载窗口背景图片
    back_image = pygame.image.load('background.jpg').convert()

    # 获取小球图片的区域开状
    ball_rect = ball_image.get_rect()

    while True:

        # 退出事件处理
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

        # 使小球移动，速度由speed变量控制
        cur_speed = control_ball(event)

        # Rect的clamp方法使用移动范围限制在窗口内
        ball_rect = ball_rect.move(cur_speed).clamp(window_size)

        # 设置窗口背景
        screen.blit(back_image, (0, 0))

        # 在背景Surface上绘制 小球
        screen.blit(ball_image, ball_rect)

        text_time = u"时间:%s" % time.strftime("%H:%M:%S", time.localtime())
        show_text(screen, (20, 400), text_time, (0, 255, 0), False)

        text_pos = u"位置: (%d,%d)" % (ball_rect.left, ball_rect.top)
        show_text(screen, (20, 420), text_pos, (0, 255, 255), False)

        author_info = u"Kevin Qu"
        show_text(screen, (20, 440), author_info, (0, 0, 255), False, 16, True)

        title_info = u"小蝴蝶是小光光的好朋友"
        show_text(screen, (250, 20), title_info, (255, 0, 0), False, 40)

        # 更新窗口内容
        pygame.display.flip()

if __name__ == '__main__':
    play_ball()
