from django.db import models
from django.conf import settings
from threads.models import Thread

# 	Poll model to store the poll name
class Poll(models.Model):
    question = models.TextField()
    #   Create One to One relationship with Thread
    thread = models.OneToOneField(Thread,null=True)

    #	make available in admin
    def __unicode__(self):
    	return self.question

#	A Poll Subject model to store what options are available to be voted on in our poll
class PollSubject(models.Model):
	name = models.CharField(max_length=255)
	poll = models.ForeignKey(Poll,related_name='subjects')

	def __unicode__(self):
		return self.name 


#	A Vote model to store the votes, so we can do a count up later 
#	when showing which subject is most popular
#	Relates to Poll, PollSubject and User
class Vote(models.Model):
	poll = models.ForeignKey(Poll, related_name='votes')
	#	We will have one poll but many subjects
	subject = models.ForeignKey(PollSubject, related_name='votes')
	user = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='votes')

