# Django Hosting Panel for PowerDNS

Django RESTful API for a multi-user and multi-domain manager for PowerDNS. Javascript front-end built with ExtJS framework

## Prerequisities

```
Docker
Docker-Compose
```

## Installing
Go to the root directory and type
```
docker-compose up
```

## Running

To get the IP of the web container type
```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' web
```

To get the IP of the PowerDNS container type
```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' pdns
```

Open your browser and type the web container ip followed by the port 8000
```
http://web_container_ip:8000
```
Enter the testing credentials:
user: **test**
```
user: test
password: test_pass
```

## Testing

### Testing the PowerDNS server
Open a console and fill the following command, changing the container IP and entering the domain name you want to test
```
dig @powerdns_container_ip and  name_to_test
```
### Testing the Django web app
Access the container:
```
docker exec -i -t web /bin/bash
```

Inside the /code directory, just type:
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
