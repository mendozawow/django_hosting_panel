# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Apachevhost(models.Model):
    servername = models.CharField(db_column='serverName', unique=True, max_length=128)  # Field name made lowercase.
    documentroot = models.CharField(db_column='documentRoot', max_length=256)  # Field name made lowercase.
    domain_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'apachevhost'


class Cryptokeys(models.Model):
    domain_id = models.IntegerField()
    flags = models.IntegerField()
    active = models.IntegerField(blank=True, null=True)
    content = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cryptokeys'


class Domainmetadata(models.Model):
    domain_id = models.IntegerField()
    kind = models.CharField(max_length=32, blank=True, null=True)
    content = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'domainmetadata'


class Domains(models.Model):
    name = models.CharField(unique=True, max_length=255)
    master = models.CharField(max_length=128, blank=True, null=True)
    last_check = models.IntegerField(blank=True, null=True)
    type = models.CharField(max_length=6, blank=True, null=True)
    notified_serial = models.IntegerField(blank=True, null=True)
    user = models.ForeignKey('Users', models.CASCADE)
    enabled = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'domains'


class Migrations(models.Model):
    migration = models.CharField(max_length=255)
    batch = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'migrations'


class PasswordResets(models.Model):
    email = models.CharField(max_length=255)
    token = models.CharField(max_length=255)
    created_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'password_resets'


class PostfixAliases(models.Model):
    pkid = models.SmallIntegerField(primary_key=True)
    mail = models.CharField(unique=True, max_length=120)
    destination = models.CharField(max_length=120)
    enabled = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'postfix_aliases'


class PostfixUsers(models.Model):
    id = models.CharField(primary_key=True, max_length=128)
    name = models.CharField(max_length=128)
    uid = models.SmallIntegerField()
    gid = models.SmallIntegerField()
    home = models.CharField(max_length=255)
    maildir = models.CharField(max_length=255)
    enabled = models.IntegerField()
    change_password = models.IntegerField()
    clear = models.CharField(max_length=128)
    crypt = models.CharField(max_length=128)
    quota = models.CharField(max_length=255)
    domain_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'postfix_users'


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


class RoleUser(models.Model):
    user_id = models.IntegerField()
    role_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'role_user'


class Roles(models.Model):
    name = models.CharField(unique=True, max_length=255)
    display_name = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'roles'


class Supermasters(models.Model):
    ip = models.CharField(max_length=64)
    nameserver = models.CharField(max_length=255)
    account = models.CharField(max_length=40)

    class Meta:
        managed = False
        db_table = 'supermasters'
        unique_together = (('ip', 'nameserver'),)


class Tsigkeys(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    algorithm = models.CharField(max_length=50, blank=True, null=True)
    secret = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tsigkeys'
        unique_together = (('name', 'algorithm'),)


class Users(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    email = models.CharField(unique=True, max_length=255)
    password = models.CharField(max_length=60)
    remember_token = models.CharField(max_length=100, blank=True, null=True)
    google2fa_secret = models.CharField(max_length=50, blank=True, null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'users'


class VsftpAccounts(models.Model):
    username = models.CharField(unique=True, max_length=30)
    pass_field = models.CharField(db_column='pass', max_length=50)  # Field renamed because it was a Python reserved word.
    domain_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'vsftp_accounts'
