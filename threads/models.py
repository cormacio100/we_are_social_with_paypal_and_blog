"""
MODELS for a FORUM
	SUBJECT
	THREADS
		POSTER
	POSTS
		POSTER


SUBJECT MODEL
Subjects will be created ONLY inthe site admin pages as only the site admin
should be able to specify what subjects are available to be discussed on the forum
Once you've created the model and run in migrations you should log in to the admin
and create a few subjects to play around with

THREAD MODEL
-   References accounts.User Model as it's user field
-   Then in accounts.User model the thread is accessible as the user.threads field in the process
of creating a Relationship. So even though we're not editing the accounts.User model directly,
we are modifying its relationship by specifying them in our new models

-   You must be an admin to create a subject via the admin screen
-   A subject can have zero or more topic threads associated with it
-   A thread can be commented on in the form of zero or more posts
-   You must be logged in to create a thread or a post

"""

from django.db import models
from django.utils import timezone
from tinymce.models import HTMLField
from django.conf import settings


#   Each Thread has a Subject
#   Admin access only for editing
class Subject(models.Model):
    #   we wont be allowing our users to access these records,
    #   we will only allow staff to edit the subject areas that users can start threads in.
    #   So, 2 fields for the Thread subject
    name = models.CharField(max_length=255)
    description = HTMLField()   # packaged with django-tinymce. It enables our field to render the WYSIWYG editor in our admin.

    def __unicode__(self):
        return self.name


#   The Thread itself
#   Foreign Keys in a one-to-many relationship are on the "one" side
class Thread(models.Model):
    name = models.CharField(max_length=255)
    #   form one-to-many relationship
    #   the thread is owned by one user. But there are many Users
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='threads') # relates to accounts.User
    #   the thread has one subject but there are many subjects
    subject = models.ForeignKey(Subject, related_name='threads')    # Relates to Subject Thread
    #   record when the item was posted
    created_at = models.DateTimeField(default=timezone.now) #

    def __unicode__(self):
        return self.name


#   One Thread has multiple Posts
class Post(models.Model):
    thread = models.ForeignKey(Thread,related_name='posts')
    comment = HTMLField(blank=True) #   allows use of timyMCE
    #   link to user who created the post
    user = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='posts')
    created_at = models.DateTimeField(default=timezone.now)

    def __unicode__(self):
        return self.comment