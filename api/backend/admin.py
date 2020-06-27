from django.contrib import admin
from .models import *


class DefaultAdmin(admin.ModelAdmin):
    pass


admin.site.register(UserProfile, DefaultAdmin)
admin.site.register(Organization, DefaultAdmin)
admin.site.register(Event, DefaultAdmin)
admin.site.register(Post, DefaultAdmin)