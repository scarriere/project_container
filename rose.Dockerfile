FROM node:alpine
ARG AUTH_KEY

RUN apk update
RUN apk upgrade
RUN apk add openssh-server

RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh

RUN ssh-keygen -A
RUN echo $AUTH_KEY > /root/.ssh/authorized_keys

RUN apk add gcompat libstdc++ curl bash git
RUN apk del dropbear
RUN apk add openssh

RUN sed -i "s|AllowTcpForwarding no|AllowTcpForwarding yes|g" /etc/ssh/sshd_config
RUN sed -i "s|PermitTunnel no|PermitTunnel yes|g" /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start SSH server on container startup
CMD ["/usr/sbin/sshd", "-D"]