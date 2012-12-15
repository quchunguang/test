'''
Created on 2012-12-12

@author: qcg
'''
import unittest
import overload

class TestKnownValues(unittest.TestCase):
    known_pairs = ((0, 0),
                   (1, 2),
                   (9, 18),
                   (11, 22),
                   (70000, 140000))
    def test_doublevalue(self):
        ''' Test doublevalue() using known cases'''
        for from_i, to_i in self.known_pairs:
            result = overload.doublevalue(from_i)
            self.assertEqual(to_i, result)
            
class TestBadValues(unittest.TestCase):
    def test_doublevalue(self):
        '''Test doublevalue() using bad input'''
        self.assertRaises(overload.NotIntegerError, \
                          overload.doublevalue, 'aa')

if __name__ == '__main__':
    unittest.main()