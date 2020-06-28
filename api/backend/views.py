from django.http import JsonResponse
from rest_framework.exceptions import NotAuthenticated, AuthenticationFailed, PermissionDenied
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from .serializers import *
from rest_framework import viewsets
import random


def get_user(request):
    if "HTTP_EMAIL" not in request.META or "HTTP_PASSWORD" not in request.META:
        raise NotAuthenticated("email or password not found in the header")
    try:
        user = User.objects.get(email=request.META["HTTP_EMAIL"], password=request.META["HTTP_PASSWORD"])
        return user
    except User.DoesNotExist:
        raise AuthenticationFailed("invalid email or password")


class UserViewSet(viewsets.ViewSet):
    permission_classes = [AllowAny]

    def list(self, request):
        queryset = User.objects.all().order_by("user_id")
        serializer = BasicUserSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        try:
            user = get_user(request)
            serializer = UserSerializer(user, many=False)
            return Response(serializer.data)
        except User.DoesNotExist:
            raise AuthenticationFailed("invalid email or password")

    def create(self, request):
        serializer = UserSerializer(data=request.data, many=False)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)

    def partial_update(self, request, pk=None):
        user = get_user(request)
        serializer = UserSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)


class OrganizationViewSet(viewsets.ModelViewSet):
    queryset = Organization.objects.all().order_by("org_id")
    serializer_class = OrganizationSerializer


class EventViewSet(viewsets.ModelViewSet):
    queryset = Event.objects.all().order_by("event_id")
    serializer_class = EventSerializer


class BadgeViewSet(viewsets.ModelViewSet):
    queryset = Badge.objects.all().order_by("badge_id")
    serializer_class = BadgeSerializer


class PostViewSet(viewsets.ViewSet):
    permission_classes = [AllowAny]

    def list(self, request):
        queryset = Post.objects.all().order_by("post_id")
        serializer = PostSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None):
        queryset = Post.objects.all()
        post = get_object_or_404(queryset, pk=pk)
        serializer = PostSerializer(post)
        return Response(serializer.data)

    def create(self, request):
        serializer = PostSerializer(data=request.data, many=False)
        if serializer.is_valid():
            if not serializer.validated_data.get("content") and not serializer.validated_data.get("link"):
                return JsonResponse({"error": "either-content-or-link-must-be-present"})
            user = get_user(request)
            serializer.save(posted_by=user)
            user.experience_points += 2 + random.randint(0, 5)  # TODO: Use a better way than random
            user.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)

    def partial_update(self, request, pk=None):
        queryset = Post.objects.all()
        post = get_object_or_404(queryset, pk=pk)
        serializer = PostSerializer(post, data=request.data, partial=True)
        if serializer.is_valid():
            if post.posted_by != get_user(request):
                raise PermissionDenied("can not edit post that are not made by current user")
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)

    def destroy(self, request, pk=None):
        queryset = Post.objects.all()
        post = get_object_or_404(queryset, pk=pk)
        serializer = PostSerializer(post, partial=True)
        if post.posted_by != get_user(request):
            raise PermissionDenied("can not delete post that are not made by current user")
        post.delete()
        return JsonResponse(serializer.data, status=204)
