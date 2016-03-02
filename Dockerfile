FROM debian:jessie
MAINTAINER Igor Goltsov <igor@ecomgems.com>

# Update system
RUN apt-get update && apt-get upgrade -y

# Install requirements
RUN apt-get install -y openssh-server
RUN apt-get install whois -y

# Copy configurations
COPY configurations/sshd_config /etc/ssh/sshd_config

# Configure some directories
RUN mkdir /var/www
RUN mkdir /var/www/public
RUN chown root:root /var/www/public
RUN chmod 755 /var/www/public

# Copy scripts
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
COPY scripts/docker-configuration.sh /docker-configuration.sh
RUN chmod +x /docker-configuration.sh

# Create groups
RUN addgroup sftp

# Environment variables
ENV USERNAME username
ENV PASSWORD password

# Volume
VOLUME /var/www/public

# Ports
EXPOSE 22
CMD /docker-entrypoint.sh
