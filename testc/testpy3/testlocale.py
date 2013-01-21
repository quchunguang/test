'''
Created on 2013-1-19

@author: Administrator
'''
import locale


locale.setlocale(locale.LC_ALL, 'English_United States.1252')
conv = locale.localeconv()  # get a mapping of conventions
x = 1234567.8
y = locale.format("%d", x, grouping=True)
z = locale.format_string("%s%.*f", (conv['currency_symbol'], conv['frac_digits'], x), grouping=True)
print(x, y, z)
