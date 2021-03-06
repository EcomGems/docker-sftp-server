# docker-sftp

Docker image for SFTP server for one user, with chroot to data directory.

## Build

To create the image `lerenn/sftp-server`, execute the following command on the sftp-server project folder :

    docker build -t lerenn/sftp-server .

## Run

Start your image with minimum arguments :

    docker run -d -p 22:22 -e USERNAME=username -e PASSWORD=password lerenn/sftp-server

With access to server's data :

    docker run -d -p 22:22 -v /path/in/host:/var/www/public -e USERNAME=username -e PASSWORD=password lerenn/sftp-server

## Arguments

### Volumes

* **/var/www/public**: Directory containing data accessible by SFTP.

### Environment variables

* **USERNAME**: Username to set as sftp user. Defaults to `username`.
* **PASSWORD**: Password to set as sftp user's password. Defaults to `password`.
