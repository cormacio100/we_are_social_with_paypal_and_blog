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

	#	We override the class __init__ so that the empty_permitted validation option is set to False
	#	Formsets by default allow empty fields, but we do not want that in our case.
	def __init__(self,*args, **kwargs):
		super(PollSubjectForm,self).__init__(*args,**kwargs)
		self.empty_permitted = False

	class Meta:
		model = PollSubject
		fields = ['name']


