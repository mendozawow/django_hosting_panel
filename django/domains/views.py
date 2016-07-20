from django.shortcuts import render
from rest_framework.generics import get_object_or_404
from rest_framework.mixins import (
    RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, ListModelMixin, CreateModelMixin
)
from rest_framework.viewsets import ModelViewSet, GenericViewSet

from .models import Domains, Records
from rest_framework.permissions import (
    IsAuthenticated,
)
from .serializers import DomainsSerializer, RecordsSerializer
from django.contrib.auth.decorators import login_required


@login_required(login_url='/login/')  # if not logged in redirect to login/
def home(request):
    return render(request, 'home.html')


@login_required(login_url='/login/')
def panel(request):
    return render(request, 'panel.html')


class DomainsViewSet(ModelViewSet):
    serializer_class = DomainsSerializer
    permission_classes = (IsAuthenticated,)
    queryset = Domains.objects.all()

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def get_queryset(self):
        return Domains.objects.filter(user=self.request.user)


class RecordsViewSet(
    RetrieveModelMixin, UpdateModelMixin, DestroyModelMixin, GenericViewSet
):
    queryset = Records.objects.all()
    serializer_class = RecordsSerializer
    permission_classes = (IsAuthenticated,)


class NestedRecordsViewSet(RecordsViewSet, CreateModelMixin, ListModelMixin, GenericViewSet):
    def get_domain(self, request, domain_pk=None):
        """
        Look for the referenced domain
        """
        # Check if the referenced domain exists
        domain = get_object_or_404(Domains.objects.all(), pk=domain_pk)

        # Check permissions
        self.check_object_permissions(self.request, domain)

        return domain

    def create(self, request, *args, **kwargs):
        self.get_domain(request, domain_pk=kwargs['domain_pk'])

        return super(NestedRecordsViewSet, self).create(request, *args, **kwargs)

    def perform_create(self, serializer):
        serializer.save(
            domain_id=self.kwargs['domain_pk']
        )

    def get_queryset(self):
        return Records.objects.filter(domain=self.kwargs['domain_pk'])

    def list(self, request, *args, **kwargs):
        self.get_domain(request, domain_pk=kwargs['domain_pk'])

        return super(NestedRecordsViewSet, self).list(request, *args, **kwargs)
