'''
Created on 2013-1-19

@author: Administrator
'''
class Employee:
    pass

john = Employee() # Create an empty employee record

# Fill the fields of the record
john.name = 'John Doe'
john.dept = 'computer lab'
john.salary = 1000
i=0
for item in dir(john):
    i+=1
print(i)