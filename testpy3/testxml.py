"""
Created on 2012-12-12

@author: qcg
"""
try:
    from lxml import etree
except ImportError:
    import xml.etree.ElementTree as etree

tree = etree.parse('feed.xml')
root = tree.getroot()
print(root)
# for item in root:
#    print(item)
entries = root.findall('{http://www.w3.org/2005/Atom}entry')
title_element = entries[0].find('{http://www.w3.org/2005/Atom}title')
print(title_element.text)
if(title_element is not None):
    print('title_element exist')

if(len(title_element) == 0):
# if(title_element):   NOT GOOD!
    print('title_element has no sub-elements')

all_links_in_all_level = tree.findall('//{http://www.w3.org/2005/Atom}link')
print(all_links_in_all_level[0].attrib['href'])
