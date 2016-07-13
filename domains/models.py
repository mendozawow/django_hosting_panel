from __future__ import unicode_literals

from django.db import models


class Domains(models.Model):
    name = models.CharField(max_length=255)
    master = models.CharField(max_length=255)
    last_check = models.IntegerField()
    type = models.CharField(max_length=6)
    notified_serial = models.IntegerField()
    user_id = models.IntegerField()

    class Meta:
        ordering = ('id',)