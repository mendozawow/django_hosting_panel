from rest_framework import serializers
from domains.models import Domains


class DomainSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(required=False, allow_blank=True, max_length=100)

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
        instance.save()
        return instance
