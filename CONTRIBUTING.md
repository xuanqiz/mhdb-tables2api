modification of original CMI work

210324
file: api/settings/**settings.py**

```
'DATABASES = {
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
```

210326 add-on explanations: 
If you would like to update the code to generate a new Postgresql at your own computer, following the steps to set-up the enviroment:
1. download and install [PostgreSQL](https://www.postgresql.org/download/)
2. download and install [postgres.app](https://postgresapp.com/downloads.html) OR [PGAdmin4](https://www.pgadmin.org/download/)
3. Set up User and Password as **postgres** (if you use others, remember to change it correspondingly in the settings.py )
4. double check the port, default is 5432
5. Create a database in the local server(by Postgres.app or PGAdmin4), and modify the 'NAME' in the settings.py correspondingly
6. Dijango updates (migrate, makemigrations etc.)
7. Generation: pg_dump -U postgres 'NAME' > NameofYourWish.sql

