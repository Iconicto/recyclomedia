from django.http import JsonResponse
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from .serializers import *
from rest_framework import viewsets


class UserViewSet(viewsets.ViewSet):
    permission_classes = [AllowAny]

    def list(self, request):
        if "HTTP_EMAIL" not in request.META or "HTTP_PASSWORD" not in request.META:
            return Response({"error": "unauthorized"}, status=401)
        try:
            user = User.objects.get(email=request.META["HTTP_EMAIL"], password=request.META["HTTP_PASSWORD"])
            queryset = User.objects.get(user_id=user.user_id)
            serializer = UserSerializer(queryset, many=False)
            return Response(serializer.data)
        except User.DoesNotExist:
            return Response({"error": "user-not-found"}, status=404)

    def create(self, request):
        serializer = UserSerializer(data=request.data, many=False)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)


class OrganizationViewSet(viewsets.ModelViewSet):
    queryset = Organization.objects.all()
    serializer_class = OrganizationSerializer


class EventViewSet(viewsets.ModelViewSet):
    queryset = Event.objects.all()
    serializer_class = EventSerializer


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
