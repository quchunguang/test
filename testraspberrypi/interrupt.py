import RPIO

def gpio_callback(gpio_id, val):
    print("gpio %s: %s" % (gpio_id, val))

def socket_callback(socket, val):
    print("socket %s: '%s'" % (socket.fileno(), val))
    socket.send("echo: %s\n" % val)

# GPIO 中断回调
RPIO.add_interrupt_callback(7, gpio_callback)
RPIO.add_interrupt_callback(9, gpio_callback, pull_up_down=RPIO.PUD_UP)

# 回调服务器端口 8080 TCP socket
RPIO.add_tcp_callback(8080, socket_callback)

# 阻断主 epoll 循环
RPIO.wait_for_interrupts()
