from django.db import models
from django.contrib.auth.models import User


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    experience_points = models.IntegerField(default=0, blank=False, null=False)
    profile_picture = models.ImageField(upload_to='profile_picture/%Y/%m/%d/')


class Organization(models.Model):
    org_id = models.AutoField(editable=False, verbose_name='Organization ID', primary_key=True)
    name = models.CharField(max_length=100, verbose_name='Organization Name', blank=False, null=False)
    email = models.EmailField()
    org_picture = models.ImageField(upload_to='org_picture/%Y/%m/%d/')


class Event(models.Model):
    event_id = models.AutoField(editable=False, verbose_name='Event ID', primary_key=True)
    org_id = models.ForeignKey(to="Organization", on_delete=models.DO_NOTHING)
    name = models.CharField(max_length=100, verbose_name='Event Name', blank=False, null=False)
    time = models.DateTimeField(blank=False, null=False)
    duration = models.TimeField(blank=False, null=False)
    content = models.TextField(blank=False, null=False)
    banner = models.ImageField(upload_to='event_banners/%Y/%m/%d/')


class Post(models.Model):
    post_id = models.AutoField(editable=False, verbose_name='Post ID', primary_key=True)
    title = models.CharField(max_length=100, blank=False, null=False)
    banner = models.ImageField(upload_to='post_banners/%Y/%m/%d/')
    type = models.CharField(max_length=5, choices=(("VIDEO", "Video"), ("TEXT", "Text")), blank=False, null=False)
    link = models.URLField()
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    updated_at = models.DateTimeField(auto_now=True, editable=False)