from rest_framework import serializers
from .models import User, Organization, Event, Post


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('user_id', 'first_name', 'last_name', 'email', 'password', 'experience_points', 'profile_picture')


class BasicUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('user_id', 'first_name', 'last_name', 'email', 'experience_points')


class OrganizationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organization
        fields = ('org_id', 'name', 'email', 'org_picture')


class EventSerializer(serializers.ModelSerializer):
    managed_by = OrganizationSerializer(many=False, read_only=True)

    class Meta:
        model = Event
        fields = ('event_id', 'name', 'time', 'duration', 'content', 'banner', 'managed_by')


class PostSerializer(serializers.ModelSerializer):
    posted_by = BasicUserSerializer(many=False, read_only=True)

    class Meta:
        model = Post
        fields = ('post_id', 'title', 'banner', 'type', 'link', 'content', 'posted_by', 'created_at', 'updated_at')


