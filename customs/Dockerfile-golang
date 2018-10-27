# Developer rDod Image
# Using Developer rDoD Image as base
FROM mderasse/rdod:developer

LABEL maintainer="Matthieu DERASSE <github@derasse.fr>"

# Back to Root
USER 0

# Configure Developer System
COPY golang.yml /opt/rdod/custom/install.yml
COPY roles/golang /opt/rdod/custom/roles/golang

# Launching System Installation
RUN ansible-playbook /opt/rdod/custom/install.yml

# Back to User
USER 1000
