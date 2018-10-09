# Basic rDod Image to use for base of any customized one
FROM ubuntu:latest

LABEL maintainer="Matthieu DERASSE <github@derasse.fr>"

# ENV Configuration
ENV DEBIAN_FRONTEND=noninteractive \
    VNC_PORT=5901 \
    NO_VNC_PORT=5911

# Expose our VNC AND HTML VNC server
EXPOSE $VNC_PORT $NO_VNC_PORT

# Installing ansible in one step to keep real step in the Build
RUN apt-get update && \
    apt-get install -qq --no-install-recommends -y apt-utils && \
    apt-get install -qq --no-install-recommends -y gnupg dirmngr && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -qq --no-install-recommends -y ansible

# Configure Default System
COPY base /opt/rdod/base

# Launching System Installation
RUN ansible-playbook /opt/rdod/base/install.yml

COPY launch.sh /opt/rdod/launch.sh
RUN chmod +x /opt/rdod/launch.sh && \
    chown -R user:user /var/log/supervisor

USER 1000
WORKDIR /home/user

# Entrypoint
CMD ["/opt/rdod/launch.sh"]
