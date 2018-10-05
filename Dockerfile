# Basic rDod Image to use for base of any customized one
FROM ubuntu:latest

LABEL maintainer="Matthieu DERASSE <github@derasse.fr>"

# ENV Configuration
ENV DEBIAN_FRONTEND=noninteractive \
    VNC_PORT=5901 \
    NO_VNC_PORT=5905

# Expose our VNC AND HTML VNC server
EXPOSE $VNC_PORT $NO_VNC_PORT

# Installing ansible in one step to keep real step in the Build
RUN apt-get update && \
    apt-get install -qq --no-install-recommends -y apt-utils && \
    apt-get install -qq --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -qq --no-install-recommends -y ansible

# Configure Default System
COPY ./base /opt/rdod/base

# Launching System Installation
RUN ansible-playbook /opt/rdod/base/install.yml

# Entrypoint
