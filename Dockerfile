FROM debian:jessie
MAINTAINER Louis Fradin <louis.fradin@gmail.com>

# Update system
RUN apt-get update && apt-get upgrade -y

# Install requirements
RUN apt-get install -y openssh-server
RUN apt-get install whois -y

# Copy configurations
COPY configurations/sshd_config /etc/ssh/sshd_config

# Configure some directories
RUN mkdir /server
RUN chmod 777 /server

# Copy scripts
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
COPY scripts/docker-configuration.sh /docker-configuration.sh
RUN chmod +x /docker-configuration.sh

# Environment variables
ENV USERNAME username
ENV PASSWORD password

# Ports
EXPOSE 22
CMD /docker-entrypoint.sh
