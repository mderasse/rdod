#!/bin/bash
echo "test" | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd

/usr/bin/supervisord --pidfile=$HOME/.vnc/supervisord.pid
