"""hosting_panel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""

from django.conf.urls import include, url
from django.contrib import admin
from rest_framework.routers import DefaultRouter
from rest_framework_nested.routers import NestedSimpleRouter

from rest_framework.authtoken.views import obtain_auth_token
from django.conf import settings

from domains.views import DomainsViewSet, NestedRecordsViewSet, panel

router = DefaultRouter(trailing_slash=False)
router.register(r'domains', DomainsViewSet)


domains_router = NestedSimpleRouter(router, r'domains', lookup='domain', trailing_slash=False)
domains_router.register(r'records', NestedRecordsViewSet)


urlpatterns = [

    url(r'^$', panel, name='panel'),

    url(r'^panel/$', panel, name='panel'),

    # Stock django auth forms
    url('^', include('django.contrib.auth.urls')),

    url(r'^api/', include(router.urls)),
    url(r'^api/', include(domains_router.urls)),

    url(r'^rest-auth/', include('rest_auth.urls')),

    url(r'^api/token/', obtain_auth_token, name='api-token'),

    url(r'^admin/', admin.site.urls),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns.append(url(r'^__debug__/', include(debug_toolbar.urls)))

