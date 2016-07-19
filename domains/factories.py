import factory
from factory import fuzzy
from django.contrib import auth
from . import models


class User(factory.DjangoModelFactory):
    class Meta:
        model = auth.get_user_model()
        exclude = ('raw_password',)

    first_name = 'Test'
    last_name = factory.Sequence(lambda n: 'User {0}'.format(n))
    email = factory.sequence(lambda n: 'account{0}@example.com'.format(n))
    username = factory.sequence(lambda n: 'test{0}'.format(n))
    raw_password = 'test*me'
    password = factory.PostGenerationMethodCall('set_password', raw_password)
    is_active = True


class Domains(factory.DjangoModelFactory):

    class Meta:
        model = models.Domains

    user = factory.SubFactory(User)
    name = factory.Sequence(lambda n: 'domain{0}.com'.format(n))


class Records(factory.DjangoModelFactory):

    class Meta:
        model = models.Records

    domain = factory.SubFactory(Domains)
    name = 'test.'
    # name = factory.LazyAttribute(lambda domain: 'test{0}.{1}'.format(domain).lower())
    type = 'A'
    content = '127.0.0.1'
    ttl = fuzzy.FuzzyInteger(low=60, high=120, step=1)
    prio = 0
    change_date = 0
    disabled = 0

    @factory.post_generation
    def name(self, create, extracted, **kwargs):
        if not create:
            return

        if extracted:
            for name in extracted:
                self.name = name + self.domain.name
