# Omeka-S in Docker containers

## Prepare the git repository

This Omeka install contains modules managed by git, so you need to init them:

```sh
git submodule update --init --recursive
```

To update them, run the following command:

```sh
git submodule update --remote --merge --recursive
```

Of course, if some of the modules use composer or npm, you need to update them
too.

## Launch the containers

Install Docker and Docker-compose on your host (can be a physical or virtual machine).

Download the file "docker-compose.yml".

From the directory containing the "docker-compose.yml" file:

```sh
sudo docker-compose up -d
```

This will deploy three Docker containers:

- Container 1: mariadb (mysql)
- Container 2: phpmyadmin (connected to container 1)
- Container 3: omeka-s (connected to container 1)

With your browser, go to:

- Omeka-S: http://hostname
- PhpMyAdmin: http://hostname:8080

At that point, you can start configuring your Omeka-S web portal.

Remarks:

- images will be downloaded automatically from the Docker hub: mariadb:latest, phpmyadmin:latest, dodeeric/omeka-s:latest.
- for the omeka-s container, /var/www/html/files (media files uploaded by the users) and /var/www/html/config/database.ini (configuration file with the credentials for the db) are put in a named volume and will survive the removal of the container. The mariadb container also puts the data (omeka-s db in /var/lib/mysql) in a named volume. Volumes are hosted in the host filesystem (/var/lib/docker/volumes).

To stop the containers:

```sh
sudo docker-compose stop
```

To remove the containers:

```sh
sudo docker-compose rm
```

Remark: this will NOT delete the volumes (omeka and mariadb). If you launch again "sudo docker-compose up -d", the volumes will be re-used.

To login into a container:

```sh
sudo docker container exec -it <container-id-or-name> bash
```

## Test the containers on localhost

First, to simplify dev and avoid to add `sudo` to all docker commands, create a
group `docker` and include yourself inside it.

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

See [post install documentation](https://docs.docker.com/engine/install/linux-postinstall/) for more informations.
Note that by default, containers are saved in /var/lib/docker, so you may have to change it when space is missing.


Then, from the same directory than above, launch the containers:

```sh
docker-compose -f docker-compose-dev.yml up -d
```

Omeka will be available on http://localhost and phpmyadmin on http://localhost:8080

To add a test user if you don't have a personal key, you can use phpmyadmin to
create a new user with the following password hash: `$2y$10$4zx/vEN4JnYwO07PpGet0eGtI2KACi96aSdVplaMIKsQEHOfAmY1u`,
(`localtest`) and the role `global_admin`.

To save and display the logs, you can edit the file ".htaccess" at the root of
the directory in order to replace `production` by `development`, or you can run
these commands when the containers are **_up_**:

```sh
docker exec omeka-s-docker_omeka_1 sed -i 's~SetEnv APPLICATION_ENV "production"~SetEnv APPLICATION_ENV "development"~g' /var/www/html/.htaccess
docker exec omeka-s-docker_omeka_1 sed -i "s~'log' => false,~'log' => true,~g" /var/www/html/config/local.config.php
docker exec omeka-s-docker_omeka_1 sed -i 's~Logger::NOTICE~Logger::DEBUG~' /var/www/html/config/local.config.php
```

If you run docker with sudo, the directory "files/" is not mounted: you must set
the environnement value PWD to the current directory, else you can set the
current directory inside the file "docker-compose-dev.yml" (not recommended).

If you update the Dockerfile or the modules, you need to rebuild the image and
to restart the containers, so the whole process will be:

```sh
docker-compose stop
docker-compose build
docker-compose -f docker-compose-dev.yml up -d
```

**WARNING**: with the development config, the Omeka files are saved in the
current directory "files/", so they may be removed by git.

## Build a new image (optional)

If you want to modify the omeka-s image (by changing the Dockerfile file), you will need to build a new image:

E.g.:

```sh
git clone https://github.com/dodeeric/omeka-s-docker.git
cd omeka-s-docker
```

Edit the Dockerfile file.

Once done, build the new Docker image:

```sh
sudo docker image build -t foo/omeka-s:1.0.1-bar .
sudo docker image tag foo/omeka-s:1.0.1-bar foo/omeka-s:latest
```

Upload the image to your Docker hub repository:

Login in your account (e.g. foo) on hub.docker.com, and create a repository "omeka-s", then upload your customized image:

```sh
sudo docker login --username=foo
sudo docker image push foo/omeka-s:1.0.1-bar
sudo docker image push foo/omeka-s:latest
```

## Use Traefik as proxy (optional)

If you want to access all your web services on port 80 (or 443), you can use the Traefik reverse proxy and load balancer.

Here we have 3 web servers running (phpmyadmin, omeka-s, gramps). All are reachable on port 80 after launching this command:

```sh
sudo docker-compose -f docker-compose-traefik.yml up -d
```

All xxx.dodeeric.be dns names are directed to the Traefik container which will proxy them to the corresponding service container. The xxx.dodeeric.be dns names have to point to the IP of the Docker host.

With your browser, go to: (dodeeric.be is replaced by your dns domain; e.g. mydomain.com)

- Omeka-S: http://omeka.mydomain.com
- PhpMyAdmin: http://pma.mydomain.com
- Gramps: http://gramps.mydomain.com

Traefik has a management web interface: http://hostname:8080

Only the Traefik container exposes its TCP ports (80, 443, 8080) on the Docker host; the service containers run on the private "network1" network.
