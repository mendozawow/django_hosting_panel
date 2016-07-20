from rest_framework import serializers

from .models import Domains, Records
from .validators import validate_record_content, validate_server_name
import factories


class DomainsSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        '''
        Create a Domain instance with the validated data and create a SOA Record for this Domain
        :param validated_data:
        :return:
        '''
        domain = Domains(**validated_data)
        domain.save()
        record = factories.Records(domain=domain,
                                   name=domain.name,
                                   type='SOA',
                                   content=domain.name + '. postmaster.' + domain.name + '. 1 3600 600 86400 3600',
                                   ttl=120)
        record.save()
        return domain

    class Meta:
        model = Domains
        fields = ('id', 'name', 'enabled')
        required_field_names = ('name',)
        read_only_fields = ('id',)


class RecordsSerializer(serializers.ModelSerializer):
    def validate(self, attrs):
        """
        Validate the record content based on the record type
        """

        # FIXME must be a better way to do this, its ugly
        # if the record is being created, there is no instance to domain and the type must be grabbed from the attrs
        # if the record exists, the domain related object also exists, and the type is also defined
        # if the record is being updated and type and content are being set, we need to check if the content
        # is valid for that specific type
        def get_domain():
            if self.instance is not None:
                return self.instance.domain.name
            return Domains.objects.get(pk=self.context['view'].kwargs['domain_pk'])

        def get_record_type():
            record_type = attrs.get('type', None)
            if record_type is None:
                record_type = self.instance.type
            return record_type

        if attrs.get('name', None) is not None:
            if not validate_server_name(get_domain().name, attrs['name']):
                raise serializers.ValidationError("Invalid record name. Must contain the domain name.")

        if attrs.get('content', None) is not None:
            if not validate_record_content(get_record_type(), attrs['content']):
                raise serializers.ValidationError("Invalid content for this record type.")

        return attrs

    class Meta:
        model = Records
        read_only_fields = ('id', 'domain')
        exclude = ('domain',)
