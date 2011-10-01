import unittest
from pprint import pprint

import feedparser

class FeedparserTest(unittest.TestCase):
    """
    A test class for the feedparser module.
    """
    
    def setUp(self):
        """
        set up data used in the tests.
        setUp is called before each test function execution.
        """
        self.developerWorksUrl = "testData/developerworks.rss"       
        self.nonExistentUrl = "testData/nonExistent.rss" 
  
    def tearDown(self):
        """
        tear down any data used in tests
        tearDown is called after each test function execution.
        """
        pass
        
    def testParse09Rss(self):
        """
        Test a successful run of the parse function for a
        0.91 RSS feed.
        """
        print "FeedparserTest.testParse09RSS()"
        
        result = feedparser.parse(self.developerWorksUrl)
        pprint(result)

        self.assertEqual(0, result['bozo'])
        
        self.assert_(result is not None)
        channel = result['channel']
        self.assert_(channel is not None)
        chanDesc = channel['description']
        self.assertEqual(u'The latest content from IBM developerWorks',
            chanDesc)
        
        items = result['items']
        self.assert_(items is not None)
        self.assert_(len(items)> 3)
        firstItem = items[0]
        title = firstItem['title']
        self.assertEqual(u'Build installation packages with solution installation and deployment technologies',
            title)
        
    def testParseMissingFile(self):
        """
        Test out the scenario where the RSS URL/file cannot
        be opened.
        """
        print "\n\nFeedparserTest.testParseMissingFile()"
        
        result = feedparser.parse(self.nonExistentUrl)
        pprint(result)
        
        # Bozo should be set and we should have an exception
        self.assertEqual(1, result['bozo'])
        e = result['bozo_exception']
        self.assert_(e is not None)
        
if __name__ == '__main__':
    unittest.main()


