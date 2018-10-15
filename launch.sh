#!/bin/bash

# ------------------------------------------------------------------------------
VNC_RW_GENERATED=false
VNC_RO_GENERATED=false

if [ -f /run/secrets/VNC_RW_PASSWORD ]; then
  VNC_RW_PASSWORD=$(head -n 1 /run/secrets/VNC_RW_PASSWORD)
elif [ -z "$VNC_RW_PASSWORD" ]; then
  VNC_RW_GENERATED=true
  VNC_RW_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 15)
fi

if [ -f /run/secrets/VNC_RO_PASSWORD ]; then
  VNC_RO_PASSWORD=$(head -n 1 /run/secrets/VNC_RO_PASSWORD)
elif [ -z "$VNC_RO_PASSWORD" ]; then
  VNC_RO_GENERATED=true
  VNC_RO_PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 15)
fi

echo $VNC_RW_PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
echo $VNC_RO_PASSWORD | vncpasswd -f >> $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd
# ------------------------------------------------------------------------------

VNC_ADDRESS=$(hostname -i)
echo "----------- Connection Informations -----------"
echo " You can connect to rDoD with : "
echo "   - VNC Viewer: $VNC_ADDRESS:5901"
echo -e "   - noVNC: http://$VNC_ADDRESS:5911/\n"
echo -e " Port might differ base on your docker configuration\n"

echo " Credentials: "
if [ "$VNC_RW_GENERATED" = true ]; then
  echo "   - VNC Read-Write Password: $VNC_RW_PASSWORD"
else
  echo "   - VNC Read-Write Password: ***************"
fi
if [ "$VNC_RO_GENERATED" = true ]; then
  echo "   - VNC Read-Only Password:  $VNC_RO_PASSWORD"
else
  echo "   - VNC Read-Only Password:  ***************"
fi
echo "-----------------------------------------------"

unset VNC_RW_PASSWORD
unset VNC_RO_PASSWORD

/usr/bin/supervisord --pidfile=$HOME/.vnc/supervisord.pid &> /dev/null
