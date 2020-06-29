from rest_framework import serializers
from .models import User, Organization, Event, Post, Badge


class BadgeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Badge
        fields = "__all__"


class UserSerializer(serializers.ModelSerializer):
    badges = BadgeSerializer(many=True, read_only=True)

    class Meta:
        model = User
        fields = (
            'user_id', 'first_name', 'last_name', 'username', 'email', 'password', 'experience_points',
            'profile_picture', 'badges', 'badge_experience_points')


class BasicUserSerializer(serializers.ModelSerializer):
    badges = BadgeSerializer(many=True, read_only=True)

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'username', 'email', 'experience_points', 'profile_picture', 'badges',
                  'badge_experience_points')


class OrganizationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organization
        fields = ('name', 'email', 'org_picture')


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
