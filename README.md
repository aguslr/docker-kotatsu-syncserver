[aguslr/docker-kotatsu-syncserver][1]
=====================================

[![docker-pulls](https://img.shields.io/docker/pulls/aguslr/kotatsu-syncserver)](https://hub.docker.com/r/aguslr/kotatsu-syncserver) [![image-size](https://img.shields.io/docker/image-size/aguslr/kotatsu-syncserver/latest)](https://hub.docker.com/r/aguslr/kotatsu-syncserver)


This *Docker* image sets up *Kotatsu Sync Server* inside a docker container.

> **[Kotatsu Sync Server][2]** is the server for the connected mode in
> [Kotatsu][3].


Installation
------------

To use *docker-kotatsu-syncserver* with an [external database][4], follow these
steps:

1. Download the [database schema][5] to initialize your database:

       mariadb -h your_mysql_db_host -u user your_mysql_db_user < ./database.sql

2. Clone and start the container:

       docker run -p 8080:8080 \
         -e DATABASE_HOST=your_mysql_db_host \
         -e DATABASE_USER=your_mysql_db_user \
         -e DATABASE_PASSWORD=your_mysql_db_password \
         -e DATABASE_NAME=your_mysql_db_name \
         -e DATABASE_PORT=your_mysql_db_port \
         docker.io/aguslr/kotatsu-syncserver:latest

3. Connect from your *Kotatsu* app to your *Kotatsu Sync Server*'s IP address on
   port `8080`.


Build locally
-------------

Instead of pulling the image from a remote repository, you can build it locally:

1. Clone the repository:

       git clone https://github.com/aguslr/docker-kotatsu-syncserver.git

2. Change into the newly created directory and use `docker-compose` to build and
   launch the container:

       cd docker-kotatsu-syncserver && docker-compose up --build -d


[1]: https://github.com/aguslr/docker-kotatsu-syncserver
[2]: https://github.com/KotatsuApp/kotatsu-syncserver
[3]: https://github.com/KotatsuApp/Kotatsu
[4]: https://kotatsu.app/dev/sync-server/
[5]: https://raw.githubusercontent.com/KotatsuApp/kotatsu-syncserver/refs/heads/master/database.sql
