from django.shortcuts import render
from rest_framework.generics import ListCreateAPIView
from rest_framework.generics import RetrieveUpdateDestroyAPIView
from .models import Domains
from .serializers import DomainSerializer


class DomainsCreateReadView(ListCreateAPIView):
    queryset = Domains.objects.all()
    serializer_class = DomainSerializer
    lookup_field = 'id'


class DomainsReadUpdateDeleteView(RetrieveUpdateDestroyAPIView):
    queryset = Domains.objects.all()
    serializer_class = DomainSerializer
    lookup_field = 'id'
