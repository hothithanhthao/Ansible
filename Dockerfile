#SSH Server
#VERSION 1.0

#Base Image
FROM ubuntu:latest

#Maintainer Info.
LABEL org.opencontainers.image.authors="thao.ho@tuni.fi"

#Update APT repository & Install OpenSSH
RUN apt-get update \
    && apt-get install -y openssh-server

#Establish the operating directory of OpenSSH
RUN mkdir /var/run/sshd

#Allow Root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
    /etc/ssh/sshd_config

#Add a new 'sslthaoho' user
RUN useradd -m -s /bin/bash -G sudo -p $(openssl passwd -1 sslthaoho) sslthaoho

# Create sslthaoho directory in home
RUN mkdir -p /home/sslthaoho/.ssh

# Copy the ssh public key in the authorized_keys file.
COPY .ssh/id_rsa.pub /home/sslthaoho/.ssh/authorized_keys

# Change ownership of the key file. 
RUN chown sslthaoho:sslthaoho /home/sslthaoho/.ssh/authorized_keys && chmod 600 /home/sslthaoho/.ssh/authorized_keys

# Install all necessary libraries.
RUN apt-get install -y net-tools
RUN apt-get install -y python3

# Sudo for gaining "root" permission
RUN apt-get install -y sudo

# Skip requiring root password for ansible playbook
RUN echo "sslthaoho ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Expose port 22
EXPOSE 22

# Set ENTRYPOINT
ENTRYPOINT service ssh start && python3 -m http.server 8000