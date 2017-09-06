from django.test import TestCase
from home.views import get_index
from django.core.urlresolvers import resolve

class HomePageTest(TestCase):
	def test_home_page_resolves(self):
		#	resolve function is fed in the URL for the home page
		#	giving the internal representation of the home page 
		#	and also a handle to the function that would be used to 
		#	process the request.
		#	If it doesnt match, then there’s something wrong with our 
		#	urls.py file that needs fixing!
		home_page = resolve('/')
		self.assertEqual(home_page.func,get_index)internal representation of the home page and also a handle to the function that would be used to process the request