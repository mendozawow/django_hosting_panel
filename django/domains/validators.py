from rest_framework import serializers
from re import match
import iptools


def valid_hostname(value):
    return match('^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$', value)


def validate_hostname(value):
    """
    Validator function that Checks if the value provided is a valid host name
    :param value:
    :return:
    """
    if not valid_hostname(value):
        raise serializers.ValidationError('This field must be a valid Host Name.')


def validate_record_type(value):
    """
    Validator function that Checks if the value provided is a valid record type
    :param value:
    :return:
    """
    record_types = ['A', 'NS', 'SOA', 'MX', 'AAAA', 'CNAME', 'NAPTR', 'PTR', 'TXT', 'SRV']
    if value not in record_types:
        raise serializers.ValidationError('This field must be a valid Record Type.')


def validate_server_name(domain_name, value):
    """
    Checks if the value provided is a valid name. A valid record name should contain the domain name.
    ex: name "dev.google.com" is a valid record name for domain "google.com"
    :param domain_name:
    :param value:
    :return:
    """
    return match('^(?:.+\.)?' + domain_name + '$', value)


def validate_record_content(record_type, content):
    """
    Checks if the content is valid for a specific record type
    :param record_type:
    :param content:
    :return: True, False or None
    """
    types = dict(A=iptools.ipv4.validate_ip(content),
                 AAAA=iptools.ipv6.validate_ip(content),
                 NS=valid_hostname,
                 MX=valid_hostname,
                 SOA=match('^((([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)'
                           '*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])*\s+)'
                           '{2}[0-9]+(\s+[0-9]+){4}$', content))
    return types.get(record_type)
