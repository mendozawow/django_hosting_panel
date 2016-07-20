# Django Hosting Panel for PowerDNS

Django RESTful API for a multi-user and multi-domain manager for PowerDNS. Javascript front-end built with ExtJS framework

### Prerequisities

```
Docker
Docker-Compose
```

### Installing
Go to the root directory and type
```
docker-compose up
```
## Running the tests

Inside the django directory, just type:
```
./manage.py test --keepdb --failfast
```
If you want to maintain the testing database:
```
./manage.py test --keepdb
```
If you want it to stop after a failed test:
```
./manage.py test --failfast
```
## Built With

* Django
* Django Rest Framework
* Sencha ExtJS 5.1.1
* PowerDNS
* MySQL
* Docker

## Authors

* **Pablo Torres**

## License

This project is licensed under the MIT License
