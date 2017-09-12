from django.test import TestCase
from .models import User
from .forms import UserRegistrationForm
from django import forms
from django.conf import settings


class CustomerUserTest(TestCase):
	def test_manager_create(self):

		#	supply a set of data to _create_user that would 
		#	cause the if not email clause to succeed and fail, 
		#	to ensure it works in both directions so to speak

		user = User.objects._create_user(None,"test@test.com","password",False, False)

		self.assertIsNotNone(user)

		with self.assertRaises(ValueError):
			user = User.objects._create_user(None, None, "password", False,False)


	#	check the validation works for unfilld form fields
	def test_registraion_form(self):
		form = UserRegistrationForm({
			'email': 'test@test.com',
			'password1': 'letmein1',
			'password2': 'letmein1',
			'stripe_id': settings.STRIPE_SECRET,
			'credit_card_number': 4242424242424242,
			'cvv': 123,
			'expiry_month': 1,
			'expiry_year': 2033
		})

		#	check the form details are valid
		self.assertTrue(form.is_valid())
		#	with error mesage
		self.assertRaisesMessage(forms.ValidationError,"Please enter your email address",form.full_clean())

	#	test the 2 passwords are matching
	def test_registration_form_fails_with_passwords_that_dont_matxh(self):
		form = UserRegistrationForm({
			'email': 'test@test.com',
			'password1': 'letmein1',
			'password2': 'letmein3',
			'stripe_id': settings.STRIPE_SECRET,
			'credit_card_number': 4242424242424242,
			'cvv': 123,
			'expiry_month': 1,
			'expiry_year': 2033
		})		
		self.assertFalse(form.is_valid())
		#self.assertRaisesMessages(forms.ValidationError,"Passwords do not match",form.full_clean())


	#	empty passowrd test
	def test_registraion_form_empty_password(self):
		form = UserRegistrationForm({
			'email': 'test@test.com',
			'password1': '',
			'password2': '',
			'stripe_id': settings.STRIPE_SECRET,
			'credit_card_number': 4242424242424242,
			'cvv': 123,
			'expiry_month': 1,
			'expiry_year': 2033
			})

		self.assertFalse(form.is_valid())


	#	empty passowrd test
	def test_registraion_form_different_passwords(self):
		form = UserRegistrationForm({
			'email': 'test@test.com',
			'password1': 'letmein1',
			'password2': '',
			'stripe_id': settings.STRIPE_SECRET,
			'credit_card_number': 4242424242424242,
			'cvv': 123,
			'expiry_month': 1,
			'expiry_year': 2033
			})

		self.assertFalse(form.is_valid())



#	Class derived from test class
#class SimpleTest(TestCase):
	#	perform 2 tests

	#	test checks that it gives the right result
	#def test_adding_something_simple(self):
	#	self.assertEqual(1+2,3)

	#	test checks that it doesn't give a wrong result
	#def test_adding_something_isnt_equal(self):
	#	self.assertNotEqual(1+2,4)


