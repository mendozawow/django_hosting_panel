from rest_framework import serializers
from domains.models import Domains


class DomainsSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(required=False, allow_blank=True, max_length=255)
    enabled = serializers.IntegerField()

    def create(self, validated_data):
        """
        Create and return a new `Domain` instance, given the validated data.
        """
        return Domains.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Domain` instance, given the validated data.
        """
        instance.name = validated_data.get('name', instance.name)
        instance.enabled = validated_data.get('enabled', instance.enabled)
        instance.save()
        return instance


class RecordsSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(required=False, allow_blank=True, max_length=255)
    # type should be a choice field
    type = serializers.CharField(allow_blank=True, max_length=10,)
    content = serializers.CharField(allow_blank=True,)
    ttl = serializers.IntegerField(allow_null=True,)
    prio = serializers.IntegerField(allow_null=True,)
    change_date = serializers.IntegerField(allow_null=True,)
    disabled = serializers.IntegerField(allow_null=True,)
    ordername = serializers.CharField(max_length=255, allow_blank=True,)
    auth = serializers.IntegerField(allow_null=True,)

    def create(self, validated_data):
        """
        Create and return a new `Domain` instance, given the validated data.
        """
        return Domains.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Domain` instance, given the validated data.
        """
        instance.name = validated_data.get('name', instance.name)
        instance.type = validated_data.get('type', instance.type)
        instance.content = validated_data.get('content', instance.content)
        instance.ttl = validated_data.get('ttl', instance.ttl)
        instance.prio = validated_data.get('prio', instance.prio)
        instance.change_date = validated_data.get('name', instance.change_date)
        instance.disabled = validated_data.get('name', instance.disabled)
        instance.ordername = validated_data.get('name', instance.ordername)
        instance.auth = validated_data.get('name', instance.auth)
        instance.save()
        return instance
