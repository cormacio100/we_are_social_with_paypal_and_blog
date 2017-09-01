from django.shortcuts import render
from django.shortcuts import render, get_object_or_404
from threads.models import Subject, Thread, Post    #   may have to change this to from models
from django.shortcuts import redirect
from django.contrib import messages, auth
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.template.context_processors import csrf
from django.shortcuts import render
from threads.models import Subject,Post, Thread
from .forms import ThreadForm, PostForm


def forum(request):
    return render(request, 'forum/forum.html', {'subjects': Subject.objects.all()})


def threads(request,subject_id):
    subject = get_object_or_404(Subject, pk=subject_id)
    return render(request,'forum/threads.html',{'subject': subject})


@login_required
def new_thread(request,subject_id):
    subject = get_object_or_404(Subject, pk=subject_id)
    if request.method == 'POST':
        #   create instances of the FORMS thread_form and post_form
        thread_form = ThreadForm(request.POST)
        post_form = PostForm(request.POST)
        if thread_form.is_valid() and post_form.is_valid():
            #   Passing false to save method stops save to DB
            #   create a memory-only version of the THREAD model
            #   The reason is to assign the user from request.user
            #   as the Thread creator before it gets saved
            thread = thread_form.save(False)
            thread.subject = subject
            thread.user = request.user
            thread.save()

            #   same for POST
            #   We create a memory-only version of the Post model
            #   We want to stop it being saved before we can assign
            #   request.user to it as the user
            post = post_form.save(False)
            post.user = request.user
            post.thread = thread
            post.save()

            messages.success(request,"You have created a new thread!")

            #   Pass to a view thread view, which is expecting arguments
            return redirect(reverse('thread',args={thread.pk}))
    else:
        #   empty forms
        thread_form = ThreadForm()
        post_form = PostForm(request.POST)

    args = {
        'thread_form' : thread_form,
        'post_form' : post_form,
        'subject' : subject,
    }
    args.update(csrf(request))

    return render(request,'forum/thread_form.html',args)


def thread(request, thread_id):
    thread = get_object_or_404(Thread, pk=thread_id)
    args = {'thread': thread}
    args.update(csrf(request))
    return render(request,'forum/thread.html',args)


@login_required
def new_post(request,thread_id):
    thread = get_object_or_404(Thread,pk=thread_id)

    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            # pause before saving the NEW_POST to the DB
            # until the current user is assigned to it
            post = form.save(False)
            post.thread = thread
            post.user = request.user
            post.save()

            messages.success(request,"Your post has been added to the thread")

            return redirect(reverse('thread',args={thread.pk}))
    else:
        form = PostForm()

    #   arguments to pass to the template
    args = {
        'form': form,
        'form_action': reverse('new_post',args={thread.id}),
        'button_text': 'Update Post'
    }
    args.update(csrf(request))

    return render(request,'forum/post_form.html',args)
