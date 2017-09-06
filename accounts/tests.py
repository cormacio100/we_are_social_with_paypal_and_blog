from unittest import TestCase


#	Class derived from test class
class SimpleTest(TestCase):
	#	perform 2 tests

	#	test checks that it gives the right result
	def test_adding_something_simple(self):
		self.assertEqual(1+2,3)

	#	test checks that it doesn't give a wrong result
	def test_adding_something_isnt_equal(self):
		self.assertNotEqual(1+2,4)
