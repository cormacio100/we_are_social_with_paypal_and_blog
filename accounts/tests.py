from django.test import TestCase
from .models import User
#from unittest import TestCase


class CustomerUserTest(TestCase):
	def test_manager_create(self):

		#	supply a set of data to _create_user that would 
		#	cause the ‘if not email’ clause to succeed and fail, 
		#	to ensure it works in both directions so to speak

		user = User.objects._create_user(None,"test@test.com","password",False, False)

		self.assertIsNotNone(user)

		with self.assertRaises(ValueError):
			user = User.objects._create_user(None, None, "password", False,False)

#	Class derived from test class
#class SimpleTest(TestCase):
	#	perform 2 tests

	#	test checks that it gives the right result
	#def test_adding_something_simple(self):
	#	self.assertEqual(1+2,3)

	#	test checks that it doesn't give a wrong result
	#def test_adding_something_isnt_equal(self):
	#	self.assertNotEqual(1+2,4)


