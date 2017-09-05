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


#   uses arrow to return a simple humanized version of the time,
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


#   Template Tag which calculates a percentage value for a POLL
@register.filter
def vote_percentage(subject):
    count = subject.votes.count()

    if count ==  0:
        return 0

    total_votes = subject.poll.votes.count()

    return (100/total_votes) * count


#   Poll voting buttons are hidden from our view by default
@register.simple_tag
def user_vote_button(thread, subject, user):
    vote = thread.poll.votes.filter(user_id=user.id).first()

    if not vote:
        if user.is_authenticated():
            link = """
            <div class="col-md-3 btn-vote">
            <a href="%s" class="btn btn-default btn-sm">
                Add my vote!
            </a>
            </div>""" % reverse('cast_vote',kwargs={'thread_id' :thread_id, 'subject_id' :subject.id})

            return link
    return ""


@register.filter
def vote_percentage(subject):
    count = subject.votes.count()
    if count == 0:
        return 0
    total_votes = subject.poll.votes.count()
    return (100 / total_votes) * count
