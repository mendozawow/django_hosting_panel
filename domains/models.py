from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from django.conf import settings


class Domains(models.Model):

    # Example field with validator
    # color = models.CharField(
    #     max_length=7,
    #     default="#fff",
    #     validators=[RegexValidator(
    #         "(^#[0-9a-fA-F]{3}$)|(^#[0-9a-fA-F]{6}$)")],
    #     verbose_name=_("color"),
    #     help_text=_("Enter the hex color code, like #ccc or #cccccc")
    #     )

    name = models.CharField(unique=True, max_length=255)
    master = models.CharField(max_length=128, blank=True, null=True)
    last_check = models.IntegerField(blank=True, null=True)
    type = models.CharField(max_length=6, blank=True, null=True)
    notified_serial = models.IntegerField(blank=True, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, models.CASCADE)
    enabled = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'domains'


class Records(models.Model):
    domain = models.ForeignKey(Domains, models.CASCADE)
    name = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=10, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    ttl = models.IntegerField(blank=True, null=True)
    prio = models.IntegerField(blank=True, null=True)
    change_date = models.IntegerField(blank=True, null=True)
    disabled = models.IntegerField(blank=True, null=True)
    ordername = models.CharField(max_length=255, blank=True, null=True)
    auth = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'records'
