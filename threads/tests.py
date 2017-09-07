from django.test import TestCase
from django.shortcuts import render_to_response
from .models import Subject


class SubjectPageTest(TestCase):
	def test_check_content_is_correct(self):
		#	assert that content of page is as expected
		subject_page = self.client.get('/forum/')
		self.assertTemplateUsed(subject_page,"forum/forum.html")
		#	supply the view with the correct params
		subject_page_template_output = render_to_response("forum/forum.html",{'subjects':Subject.objects.all()}).content 
		self.assertEqual(subject_page.content, subject_page_template_output)

