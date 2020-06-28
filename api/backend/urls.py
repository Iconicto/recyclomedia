from django.urls import include, path
from rest_framework import routers
from .views import PostViewSet, UserViewSet, OrganizationViewSet, EventViewSet, BadgeViewSet

router = routers.DefaultRouter()
router.register(r'users', UserViewSet, basename='users')
router.register(r'organizations', OrganizationViewSet)
router.register(r'events', EventViewSet)
router.register(r'posts', PostViewSet, basename='posts')
router.register(r'badges', BadgeViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]