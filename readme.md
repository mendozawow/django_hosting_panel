# Django Hosting Panel for PowerDNS

Multi-user web application to manage the registration of domains and DNS records.

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
