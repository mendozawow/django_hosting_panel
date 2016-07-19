from django.db.models import Manager
from django.utils import six
from rest_assured.testcases import ReadWriteRESTAPITestCaseMixin, BaseRESTAPITestCase
from rest_framework.reverse import reverse


class NestedReadWriteRESTAPITestCaseMixin(ReadWriteRESTAPITestCaseMixin):

    parent = None
    parent_field = ''

    def test_create(self, data=None, **kwargs):
        kwargs[self.parent_field] = self.parent.id
        return super(NestedReadWriteRESTAPITestCaseMixin, self).test_create(data, **kwargs)

    def test_list(self, **kwargs):
        kwargs[self.parent_field] = self.parent.id
        return super(NestedReadWriteRESTAPITestCaseMixin, self).test_list(**kwargs)

    def test_detail(self, **kwargs):
        kwargs[self.parent_field] = self.parent.id
        return super(NestedReadWriteRESTAPITestCaseMixin, self).test_detail(**kwargs)

    def test_update(self, data=None, results=None, use_patch=None, **kwargs):
        kwargs[self.parent_field] = self.parent.id
        return super(NestedReadWriteRESTAPITestCaseMixin, self).test_update(data, results, use_patch, **kwargs)

    def test_destroy(self, **kwargs):
        kwargs[self.parent_field] = self.parent.id
        return super(NestedReadWriteRESTAPITestCaseMixin, self).test_destroy(**kwargs)

    def get_create_url(self, **kwargs):
        """Return the create endpoint url.

        :returns: The url of create endpoint.
        """

        return reverse(self._get_create_name(), kwargs=kwargs)

    def get_create_response(self, data=None, **kwargs):
        """Send the create request and return the response.

        :param data: A dictionary of the data to use for the create request.
        :param kwargs: Extra arguments that are passed to the client's ``post()`` call.
        :returns: The response object.
        """

        if data is None:
            data = self.get_create_data()

        return self.client.post(self.get_create_url(**kwargs), data or {}, **kwargs)

    def get_destroy_response(self, **kwargs):
        """Send the destroy request and return the response.

        :param kwargs: Extra arguments that are passed to the client's ``delete()`` call.
        :returns: The view's response.
        """

        return self.client.delete(self.get_destroy_url(**kwargs), **kwargs)

    def get_destroy_url(self, **kwargs):
        """Return the destroy endpoint url.

        :returns: The url of destroy endpoint.
        """

        self.object_id = getattr(self.object, self.lookup_field)
        kwargs[self.lookup_field] = self.object_id
        return reverse(self._get_destroy_name(), kwargs=kwargs)

    def get_detail_url(self, **kwargs):
        """Return the detail endpoint url.

        :returns: The url of detail endpoint.
        """
        object_id = getattr(self.object, self.lookup_field)
        kwargs[self.lookup_field] = object_id
        return reverse(self.base_name + self.DETAIL_SUFFIX, kwargs=kwargs)

    def get_detail_response(self, **kwargs):
        """Send the detail request and return the response.

        :param kwargs: Extra arguments that are passed to the client's ``get()`` call.
        :returns: The response object.
        """

        return self.client.get(self.get_detail_url(**kwargs), **kwargs)

    def get_list_response(self, **kwargs):
        """Send the list request and return the response.

        :param kwargs: Extra arguments that are passed to the client's ``get()`` call.
        :returns: The response object.
        """

        return self.client.get(self.get_list_url(**kwargs), **kwargs)

    def get_list_url(self, **kwargs):
        """Return the list endpoint url.

        :returns: The url of list endpoint.
        """

        return reverse(self.base_name + self.LIST_SUFFIX, kwargs=kwargs)

    def get_update_response(self, data=None, results=None, use_patch=None, **kwargs):
        """Send the update request and return the response.

        :param data: Data dictionary for the update request.
        :param results: Dictionary mapping instance properties to expected values.
        :param kwargs: Extra arguments that are passed to the client's ``put()`` or ``patch()`` call.
        :returns: The response object.
        """

        if data is None:
            data = self.get_update_data()
            self.__data = data

        if results is None:
            results = self.get_update_results(data)
            self.__results = results

        args = [self.get_update_url(**kwargs), data]

        if use_patch is None:
            use_patch = self.use_patch

        return self.client.patch(*args, **kwargs) if use_patch else self.client.put(*args, **kwargs)

    def get_update_url(self, **kwargs):
        """Return the update endpoint url.

        :returns: The url of update endpoint.
        """
        self.object_id = getattr(self.object, self.lookup_field)
        kwargs[self.lookup_field] = self.object_id
        return reverse(self._get_update_name(),
                       kwargs=kwargs)

    def _update_check_db(self, obj, data=None, results=None):
        if data is None:
            data = self.__data

        if results is None:
            results = self.__results or {}

        for key, value in six.iteritems(data):
            # check if ``obj`` is a dict to allow overriding ``_update_check_db()``
            # and perform checks on a serialized object
            if isinstance(obj, dict):
                attribute = obj.get(key)
                if isinstance(attribute, list):
                    self.assertListEqual(attribute, value)
                    continue
            else:
                # check for foreign key
                if hasattr(obj, '%s_id' % key):
                    related = getattr(obj, key)
                    attribute = self.get_relationship_value(related, key)
                else:
                    attribute = getattr(obj, key)
                    # Handle case of a ManyToMany relation
                    if isinstance(attribute, Manager):
                        items = {self.get_relationship_value(item, key) for item in attribute.all()}
                        self.assertTrue(set(value).issubset(items))
                        continue

            self.assertEqual(attribute, results.get(key, value))
