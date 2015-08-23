# docker-sftp
Docker image for SFTP server for one user, with chroot to data directory.

## Build

To create the image `lerenn/docker-openssh-server`, execute the following command on the docker-openssh folder :

    docker build -t lerenn/docker-sftp .

## Run

Start your image with minimum arguments :

    docker run -d -p 22:22 -e USERNAME=username -e PASSWORD=password lerenn/docker-sftp

With access to server's data :

    docker run -d -p 22:22 -v /path/in/host:/server/data -e USERNAME=username -e PASSWORD=password lerenn/docker-sftp

## Arguments

### Volumes

* **/server/data**: Directory containing data accessible by SFTP.

### Environment variables

* **USERNAME**: Username to set as sftp user. Defaults to `username`.
* **PASSWORD**: Password to set as sftp user's password. Defaults to `password`.
