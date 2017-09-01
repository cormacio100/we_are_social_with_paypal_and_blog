import arrow
from django import template
from django.core.urlresolvers import reverse

register = template.Library()

#   CREATE FILTERS FOR USE IN TEMPLATES
#   Filter function to return a count of all the posts associated with a
#   particular thread, which in turn is associated with a subject


#   iterates through the threads contained in a subject and counts
#   up the number of posts contained in all the threads combined.
@register.filter
def get_total_subject_posts(subject):
    total_posts = 0
    for thread in subject.threads.all():
        total_posts += thread.posts.count()
    return total_posts


#   uses arrow to return a simple ‘humanized’ version of the time,
#   since the supplied datetime objects time occurred
@register.filter
def started_time(created_at):
    #   return a Human Friendly date
    return arrow.get(created_at).humanize()


#   we filter all our posts from the supplied thread and order by
#   the created_at time to find the newest post in the thread, and return the username of that user.
@register.simple_tag
def last_posted_user_name(thread):
    #   retrieve the most recent post saved
    posts = thread.posts.all().order_by('-created_at')
    #   return the username of the most recent post
    return posts[posts.count()-1].user.username



