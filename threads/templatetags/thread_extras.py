import arrow
from django import template
from django.core.urlresolvers import reverse

register = template.Library()

#   Filter function to return a count of all the posts associated with a
#   particular thread, which in turn is associated with a subject
@register.filter
def get_total_subject_posts(subject):
    total_posts = 0
    for thread in subject.threads.all():
        total_posts += thread.posts.count()
    return total_posts
