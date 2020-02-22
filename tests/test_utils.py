import unittest

class TestStringMethods(unittest.TestCase):

    def test_find_plan_correct(self):
        self.assertEqual(find_plan(('AGG',['BAgG','SAG','Dagg','AGGA','NA']) , ['BAgG', 'Dagg', 'AGGA'])

    def test_find_plan_no_plan(self):
        self.assertEqual(find_plan(('AGG',[]),'No plans to search from')

    def test_find_plan_wrong_plan(self):
        self.assertEqual(find_plan(('AGG',['NA','NAA']),'No plans found with substring AGG')

if __name__ == '__main__':
    unittest.main()