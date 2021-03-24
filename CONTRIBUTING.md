modification of original CMI work

210324
file: api/settings/**settings.py**

DATABASES = {
    'default': {
        #'ENGINE': 'django.db.backends.postgresql_psycopg2',
        #'NAME': 'lisasql1',
        #'PORT':'5431', databases created by postgres.app, 5432 for database pgadmin4
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'lisasql2',
        'USER':'postgres',
        'PASSWORD':'postgres',
        'HOST':'localhost',
        'PORT':'5432',
    }
}
