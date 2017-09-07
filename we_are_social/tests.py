from django.test import TestCase
from home.views import get_index
from django.core.urlresolvers import resolve
from django.shortcuts import render_to_response
from accounts.forms import UserRegistrationForm, UserLoginForm
from django.conf import settings
from accounts.models import User

class HomePageTest(TestCase):

	#	load test data files
	fixtures = ['subjects','user']

	#	CREATE A ONE-OFF TEST OBJECT
	def setUp(self):
		super(HomePageTest,self).setUp()
		self.user = User.objects.create(username='testuser')
		self.user.set_password('letmein')
		self.user.save()
		self.login = self.client.login(username='testuser',password='letmein')
		self.assertEqual(self.login, True)


	def test_home_page_resolves(self):
		#	resolve function is fed in the URL for the home page
		#	giving the internal representation of the home page 
		#	and also a handle to the function that would be used to 
		#	process the request.
		#	If it doesnt match, then there is something wrong with our 
		#	urls.py file that needs fixing!
		home_page = resolve('/')
		self.assertEqual(home_page.func,get_index)


	#	check that the page returns the actual page
	def test_home_page_status_code_is_ok(self):
		#	checks that content is returned on our home page
		home_page = self.client.get('/')
		self.assertEqual(home_page.status_code,200)


	#	check the content and the template for the home page
	def test_check_content_is_correct(self):
		# 	check in the response if the template we expect to be 
		#	used is the one that is actually used
		home_page = self.client.get('/')
		self.assertTemplateUsed(home_page,"index.html")
		#	check that the output of the template from the URL is the same as 
		#		what we expect when we use render_to_response to directly render its output locally
		home_page_template_output = render_to_response("index.html", {'user':self.user}).content
		self.assertEqual(home_page.content,home_page_template_output)


	#	check the status of the register page
	def test_register_page_status_code_is_ok(self):
		register_page = self.client.get('/register/')
		self.assertEqual(register_page.status_code,200)


	#	check the content and the template of the register page
	#def test_check_register_content_is_correct(self):
	#	register_page = self.client.get('/register/')
	#	self.assertTemplateUsed(register_page,"register.html")
		# register_page_output = render_to_response("register.html").content 
		# No data because you wantthe form to be empty.
	#	form = UserRegistrationForm()
	#	args = {'form': form, 'publishable': settings.STRIPE_PUBLISHABLE}
	#	register_page_output = render_to_response("register.html",args).content
	#	self.assertEqual(register_page.content,register_page_output)
	#	check the content and the template of the register page
	def test_check_register_content_is_correct(self):
		register_page = self.client.get('/register/')
		self.assertTemplateUsed(register_page,"register.html")
		# register_page_output = render_to_response("register.html").content 
		# No data because you wantthe form to be empty.
		form = UserRegistrationForm()
		args = {'form': form, 'publishable': settings.STRIPE_PUBLISHABLE}
		register_page_output = render_to_response("register.html",args).content
		self.assertEqual(register_page.content,register_page_output)


	



