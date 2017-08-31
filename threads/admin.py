from django.contrib import admin
from .models import Subject, Thread, Post


#   make accessible in admin
admin.site.register(Subject)
admin.site.register(Thread)
admin.site.register(Post)

