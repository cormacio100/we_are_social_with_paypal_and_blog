import arrow
from django import template
from django.core.urlresolvers import reverse

register = template.Library()

#   CREATE FILTERS FOR USE IN TEMPLATES
#   Filter function to return a count of all the posts associated with a
#   particular thread, which in turn is associated with a subject


@register.filter
def get_total_subject_posts(subject):
    total_posts = 0
    for thread in subject.threads.all():
        total_posts += thread.posts.count()
    return total_posts


@register.filter
def started_time(created_at):
    #   return a Human Friendly date
    return arrow.get(created_at).humanize()


@register.simple_tag
def last_posted_user_name(thread):
    #   retrieve the most recent post saved
    posts = thread.posts.all().order_by('-created_at')
    #   return the username of the most recent post
    return posts[posts.count()-1].user.username



