[![Build Status](https://travis-ci.org/henryyang42/NTHU_Course.svg?branch=master)](https://travis-ci.org/henryyang42/NTHU_Course)
# NTHU Course

[![Join the chat at https://gitter.im/henryyang42/NTHU_Course](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/henryyang42/NTHU_Course?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
A system that fetch the course data and provide service that is insinctive, easy to use.

Typing the commands below may help you build this system.
```
pip install -r requirements.txt
python manage.py syncdb
python manage.py makemigrations
python manage.py migrate
python manage.py crawl_course
python manage.py update_index
```

To clear all contents in db, use ``python manage.py crawl_course clear``

To update all syllabus, use ``python manage.py update_syllabus``

For auto decaptcha feature, it requires ``tesseract 3.03``

# Install dependency
- tesseract
    - mac: `brew install tesseract --devel # Without --devel, it will install tesseract 3.02`
    - ubuntu: `sudo apt-get install tesseract-ocr`


# Setting
We use mysql as database. The default setting will find a config file in 'NTHU_Course/mysql.ini'. The following is a sample config file:

```ini
[client]
database = <database name>
user = <mysql username>
password = <mysql password>
host = <mysql server ip>
port = <mysql server port>
default-character-set = utf8
```


# Heroku settings
To use it in heroku, you have to set the following environment variables

```bash
TESSDATA_PREFIX=/app/.apt/usr/share/tesseract-ocr/tessdata
BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
DJANGO_SETTINGS_MODULE=NTHU_Course.settings.heroku
SECRET_KEY=hard-to-guess-string
```

this can be achieved by ``heroku config:set`` or the web panel


# Build with Docker
Require docker and docker-compose.

- Set up your enviroment variable in `.env` first. Values should be the same as that in `mysql.ini` .
```ini
MYSQL_ROOT_PASSWORD=very_secret_dont_expose_on_github
MYSQL_USER=course
MYSQL_PASSWORD=very_secret_too
MYSQL_DATABASE=course
```
- Set your `server_name` in project `./bin/nginx/nginx.conf`    

- Use `docker-compose build` to build up containers defined by docker-compose.yml
- Use `docker-compose up` to turn the service on. Option: `-d` can make command dettach; then you can use `docker-compose logs` to check the log.
- Remember run `docker-compose run web python manage.py syncdb` to initial the database in django project.
- Finally, use `docker-compose run <container-name> <command>` to control containers. 
