Omeka-S in Docker containers

Install Docker and Docker-compose on your host.

Download the file "docker-compose.yml".

From the directory containing the "docker-compose.yml" file:

- sudo docker-compose up

This will deploy three Docker containers:

- Container 1: db (image: mysql)
- Container 2: db_admin (image: phpmyadmin/phpmyadmin) (connected to container 1)
- Container 3: omeka-s (image: dodeeric/omeka-s) (connected to container 1; run behind apache/php)

With your browser, go to:

- Omeka-S: http://hostname
- PhpMyAdmin: http://hostname:8080

Remarks:

- images will be loaded automatically from the Docker hub: mysql, phpmyadmin, dodeeric/omeka-s:latest.
- for the omeka-s container, /var/www/html is declared as a volume (omega-s code, modules and themes, and media uploaded by the users which are in the "files" directory). Volumes are hosted in the host filesystem. The db (mysql) container also put the data in a volume.

If you want to modify the omeka-s image (by changing the Dockerfile file), you will need to build a new image:

E.g.:

From the directory containing the Dockerfile file:

- sudo docker image build -t dodeeric/omeka-s:1.0.1 .
- sudo docker image tag dodeeric/omeka-s:1.0.1 dodeeric/omeka-s:latest

Upload the image to your Docker hub repository:

- sudo docker login --username=dodeeric
- sudo docker image push dodeeric/omeka-s:1.0.1
- sudo docker image push dodeeric/omeka-s:latest
