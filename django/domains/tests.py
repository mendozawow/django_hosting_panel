# from django.test import TestCase
from rest_assured.testcases import ReadWriteRESTAPITestCaseMixin, BaseRESTAPITestCase

from domains.testcases import NestedReadWriteRESTAPITestCaseMixin
from . import factories


class DomainsAPITestCase(ReadWriteRESTAPITestCaseMixin, BaseRESTAPITestCase):
    base_name = 'domains'
    factory_class = factories.Domains
    # see here:
    user_factory = factories.User  # needed for authentication
    update_data = {'enabled': 0}

    def setUp(self):
        self.user = factories.User.create()
        super(DomainsAPITestCase, self).setUp()

    def get_object(self, factory):
        return factory.create(user=self.user)

    def get_create_data(self):
        return {'name': 'mydomain.com',
                'user': self.user.pk}


class RecordsAPITestCase(NestedReadWriteRESTAPITestCaseMixin, BaseRESTAPITestCase):
    base_name = 'records'
    factory_class = factories.Records
    user_factory = factories.User  # needed for authentication
    update_data = {'ttl': 100}
    parent_field = 'domain_pk'

    def setUp(self):
        self.parent = factories.Domains.create()
        super(RecordsAPITestCase, self).setUp()

    def get_object(self, factory):
        return factory.create(domain=self.parent, name='test.' + self.parent.name)
