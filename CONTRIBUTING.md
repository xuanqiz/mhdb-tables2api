# Modifications and tips regarding to the original CMI work

## 210324 modifications
Path: api/settings/**settings.py**

```
'DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'lisasql2',
        'USER':'postgres',
        'PASSWORD':'postgres',
        'HOST':'localhost',
        'PORT':'5432',
    }
}
```

## 210326 add-on explanations: 
If you would like to update the code to generate a new Postgresql at your own computer, following the steps to set-up the enviroment:
1. download and install [PostgreSQL](https://www.postgresql.org/download/)
2. download and install [postgres.app](https://postgresapp.com/downloads.html) OR [PGAdmin4](https://www.pgadmin.org/download/)
3. Set up User and Password as **postgres** (if you use others, remember to change it correspondingly in the settings.py )
4. double check the port, default is 5432
5. Create a database in the local server(by Postgres.app or PGAdmin4), and modify the 'NAME' in the settings.py correspondingly
6. Dijango updates (migrate, makemigrations etc.)
7. Generation: pg_dump -U postgres 'NAME' > NameofYourWish.sql

## Extra for absolute beginners (like me)
Aim: Recreate the schema in postgresql to generate a *.sql\
[Original Github Repo](https://github.com/ChildMindInstitute/mhdb-tables2api)\
fork it to start

### Django Tutorial
[Official documentation for beginners](https://docs.djangoproject.com/en/3.1/intro/tutorial01/)\
$django-admin startproject nameofsite\
/mysite $python3 manage.py runserver\
(meanwhile, make the database ready seperately in postgresql)\
$ python3 manage.py startapp nameofproject\
$ python3 manage.py migrate\
creating models in models.py (folder:nameofproject)\
activating models in settings.py (INSTALLED_APPS + 'nameofproject.apps.NameofprojectConfig')\
$ python3 manage.py makemigrations nameofproject\
$ python3 manage.py sqlmigrate nameofproject 000X (the largest number in _init_.py)\
$ python3 manage.py migrate (again, but to update in the database)\

### Postgresql tutorial
download and install [postgres.app](https://postgresapp.com/downloads.html)\
download and install [postgresSQL](https://www.postgresql.org/download/)\
**modify properly the name and the password in the code 'settings.py'**\
Tutorial postgresSQL:
[Installing and Setting up PostgreSQL Using Postgres.app](https://www.youtube.com/watch?v=WcCjNGb8g0o)\
create database NameOfDatabase **;**

### Tips:
1. [change/forget password of postgresSQL by pgAdmin4](https://youtu.be/GjLR_qnwFUs)
2. pip install/uninstall psycopg2/psycopg2-binary
3. no len() --- str(BASE_DIR / 'NameOfDatabase') this flag can be avoid by just write the 'name'
4. manage.py flags --- use python**3** manage.py
5. psql is not found ---try sudo -u postgres psql OR cd to other places
6. database "" not found --- check whether the port is connected to the right one (psql -U postgres connected to port 5432 by default
7. owner issue --- postgres=# REASSIGN OWNED BY old_name TO new_name **;** 
8. generation code --- example: postgres=# REASSIGN OWNED BY old_name TO new_name;
9. git add; git commit -m ''; git status, git push
10. markdown documentation --- "```" for code "backslash\" visible line break 