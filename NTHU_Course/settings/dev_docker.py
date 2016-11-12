'''
A configuration for testing crawler
'''

from .default import *  # noqa

DEBUG = True

ALLOWED_HOSTS = [
    '*',
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'courses.sqlite'
    }
}
