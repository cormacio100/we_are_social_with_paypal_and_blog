from django import forms
from models import Poll, PollSubject


#	Build the FORMS used by the Polls
class PollForm(forms.ModelForm):
	question = forms.CharField(label="What is your poll about?")
	class Meta:
		model = Poll
		fields = ['question']


class PollSubjectForm(forms.ModelForm):
	name = forms.CharField(label="Poll subject name", required=True)

	def __init__(self,*args, **kwargs):
		super(PollSubjectForm,self).__init__
