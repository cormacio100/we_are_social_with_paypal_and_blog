from django.contrib import admin
from .models import Poll
from .models import PollSubject
from .models import Vote

admin.site.register(Poll)
admin.site.register(PollSubject)
admin.site.register(Vote)