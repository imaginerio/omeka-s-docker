# Omeka-S in Docker containers

## Launch the containers

Install Docker and Docker-compose on your host (can be a physical or virtual machine). 

Download the file "docker-compose.yml".

From the directory containing the "docker-compose.yml" file:

```
$ sudo docker-compose up -d
```

This will deploy three Docker containers:

- Container 1: mysql
- Container 2: phpmyadmin (connected to container 1; run behind nginx/php)
- Container 3: omeka-s (connected to container 1; run behind apache/php)

With your browser, go to:

- Omeka-S: http://hostname
- PhpMyAdmin: http://hostname:8080

Remarks:

- images will be downloaded automatically from the Docker hub: mysql, phpmyadmin, dodeeric/omeka-s:latest.
- for the omeka-s container, /var/www/html/files (media files uploaded by the users) and /var/www/html/config/database.ini (credentials for the mysql db) are declared as named volumes (and will survive the remove of the container). Volumes are hosted in the host filesystem (/var/lib/docker/volumes). The mysql container also put the data (omeka db) in a volume.

To stop the containers:

```
$ sudo docker-compose stop
```

To remove the containers:

```
$ sudo docker-compose rm 
```

Remark: this will not delete the volumes (omeka-s and mysql). If you launch again "sudo docker-compose up -d", the volumes will be re-used.

To login into a container:

```
$ sudo docker container exec -it <container-id-or-name> bash 
```

## Build a new image

If you want to modify the omeka-s image (by changing the Dockerfile file), you will need to build a new image:

E.g.:

```
$ git clone https://github.com/dodeeric/omeka-s-docker.git
$ cd omeka-s-docker
$ sudo docker image build -t blabla/omeka-s:1.0.1-myimage .
$ sudo docker image tag blabla/omeka-s:1.0.1-myimage blabla/omeka-s:latest
```

Upload the image to your Docker hub repository:

Login in your account (e.g. blabla) on hub.docker.com, and create a repository "omeka-s", then upload your customized image:

```
$ sudo docker image push blabla/omeka-s:1.0.1-myimage
$ sudo docker image push blabla/omeka-s:latest
```
