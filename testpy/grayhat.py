# -*- coding: utf-8 -*-
from ctypes import *
libc = CDLL("libc.so.6")
message_string = "Hello world!\n"
libc.printf("Test: %s", message_string)


# C Type                        Python Type                  ctypes Type
# --------------------------------------------------------------------------
# char                          1-character string           c_char
# wchar_t                       1-character Unicode string   c_wchar
# char                          int/long                     c_byte
# char                          int/long                     c_ubyte
# short                         int/long                     c_short
# unsigned short                int/long                     c_ushort
# int                           int/long                     C_int
# unsigned int                  int/long                     c_uint
# long                          int/long                     c_long
# unsigned long                 int/long                     c_ulong
# long long                     int/long                     c_longlong
# unsigned long long            int/long                     c_ulonglong
# float                         float                        c_float
# double                        float                        c_double
# char * (NULL terminated)      string or none               c_char_p
# wchar_t * (NULL terminated)   unicode or none              c_wchar_p
# void *                        int/long or none             c_void_p

print c_int(5)
seitz = c_char_p("loves the python")
print seitz.value


class beer_recipe(Structure):
    _fields_ = [
        ("amt_barley", c_int),
        ("amt_water", c_int),
    ]


class barley_amount(Union):
    _fields_ = [
        ("barley_long", c_long),
        ("barley_int", c_int),
        ("barley_char", c_char * 8),
    ]

value =  "66"
my_barley = barley_amount(int(value))
print "Barley amount as a long: %ld" % my_barley.barley_long
print "Barley amount as an int: %d" % my_barley.barley_long
print "Barley amount as a char: %s" % my_barley.barley_char
