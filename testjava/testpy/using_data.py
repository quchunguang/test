'''
Created on 2012-12-9

@author: qcg
'''
shopping=[]
lists = ['dd', 'bb', 'cc']
for item in lists:
    print item,
    shopping.append(item);
print

print shopping
shopping.sort(cmp=None, key=None, reverse=False)
print shopping
del shopping[0]
print shopping
lists.extend(shopping)
print lists

ui_ctrl = ('button', 'bar',)
ui_combol = ('cbo', ui_ctrl,)
print ui_combol
print ui_combol[1][1]

age = 22
name = 'Swaroop'
print '%s is %d years old' % (name, age)
print 'Why is %s playing with that python?' % name

ab = {'qcg'   :   'quchunguang@gmail.com',
      'ynn'   :   'ynn@grazestar.com',
      'qq'    :   'quqing@sdu.edu.cn',
      }
print "qcg's mail is", ab['qcg']
ab['test'] = 'test@test.com'
del ab['test']
for name, mail in ab.items():
    print name, mail
    
shoplist = ['apple', 'mango', 'carrot', 'banana']

# Indexing or 'Subscription' operation
print 'Item 0 is', shoplist[0]
print 'Item 1 is', shoplist[1]
print 'Item 2 is', shoplist[2]
print 'Item 3 is', shoplist[3]
print 'Item -1 is', shoplist[-1]
print 'Item -2 is', shoplist[-2]

# Slicing on a list
print 'Item 1 to 3 is', shoplist[1:3]
print 'Item 2 to end is', shoplist[2:]
print 'Item 1 to -1 is', shoplist[1:-1]
print 'Item start to end is', shoplist[:]

# Slicing on a string
name = 'swaroop'
print 'characters 1 to 3 is', name[1:3]
print 'characters 2 to end is', name[2:]
print 'characters 1 to -1 is', name[1:-1]
print 'characters start to end is', name[:]

mylist = shoplist
mylist = shoplist[:]


name = 'Swaroop' # This is a string object
if name.startswith('Swa'):
    print 'Yes, the string starts with "Swa"'
if 'a' in name:
    print 'Yes, it contains the string "a"'
if name.find('war') != -1:
    print 'Yes, it contains the string "war"'
delimiter = '_*_'
mylist = ['Brazil', 'Russia', 'India', 'China']
print delimiter.join(mylist)