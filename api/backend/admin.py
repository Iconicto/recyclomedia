from django.contrib import admin
from .models import User, Organization, Event, Post


class UserAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'first_name', 'last_name', 'email', 'experience_points', 'profile_picture')
    list_display_links = ('user_id', 'first_name', 'last_name', 'email', 'experience_points', 'profile_picture')
    list_filter = ('user_id', 'first_name', 'last_name', 'email')
    list_per_page = 30


class OrganizationAdmin(admin.ModelAdmin):
    list_display = ('org_id', 'user', 'name', 'email', 'org_picture')
    list_display_links = ('org_id', 'user', 'name', 'email', 'org_picture')
    list_per_page = 30


class EventAdmin(admin.ModelAdmin):
    print([field.name for field in Event._meta.get_fields()])
    list_display = ('event_id', 'name', 'time', 'duration', 'content', 'banner', 'managed_by')
    list_display_links = ('event_id', 'name', 'time', 'duration', 'content', 'banner', 'managed_by')
    list_filter = ('event_id', 'name', 'time', 'duration', 'content', 'banner', 'managed_by')
    list_per_page = 30

    def get_queryset(self, request):
        qs = super(EventAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(managed_by=Organization.objects.get(user=request.user))


class PostAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Post._meta.get_fields()]
    list_display_links = [field.name for field in Post._meta.get_fields()]
    list_filter = [field.name for field in Post._meta.get_fields()]
    list_per_page = 30


admin.site.register(User, UserAdmin)
admin.site.register(Organization, OrganizationAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(Post, PostAdmin)
