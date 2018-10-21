# rDoD (remote Desktop on Docker)

## Quick reference
#### Where to get help:
[Github Issues Tracker](https://github.com/mderasse/rdod/issues)

#### Where to file issues:
[Github issues Tracker](https://github.com/mderasse/rdod/issues)

#### Maintained by:
Matthieu Derasse


## Description
Have you ever dreamed moving from a desk to another without having to rebuild your environment ? To be able to access to your apps from home, job, in the bus or in the train ?
rDoD can be the solution for you !

With rDoD you will be able to launch a full Ubuntu Desktop environment in a Docker and access to it by VNC / noVNC


## Customized Versions
### rDoD
* Desktop environment [**Xfce4**](http://www.xfce.org)
* VNC Server [**TigerVNC**](https://tigervnc.org/) (default VNC port `5901`)
* HTML5 VNC Client [**noVNC**](https://github.com/novnc/noVNC) (default http port `5911`)
* Browsers:
  * Firefox
* Tools:
  * openssh-client
  * Default Network Tools

## Launch rDoD
### 1) Set Up your rDoD
rDod can be launch as it but you might want to customize. To do so, a few **environment variables** are available such as :
* **RESOLUTION**: Screen resolution of the desktop initialized by VNC Server (Default: 1920*1080)
* **USE_SSL**: Enable/Disable SSL Encryption between VNC Client <-> Server. If set to true, Certificate will be auto-generated at launch (Default: false)
* **VNC_RW_PASSWORD**: Password for log in as a Read-Write user. If not set, the password will be auto-generated at launch (Optional)
* **VNC_RO_PASSWORD**: Password for log in as a Read-Only user. If not set, the password will be auto-generated at launch (Optional)

If you are using docker-compose you can also edit the docker-compose file to customize rDod

### 2) Start rDoD
rDod cab be launch by 2 different ways :

#### a) Docker-Compose
Docker-Compose is the easiest way to launch rDoD. By using it the Home of the rDod user will be persistent.

You can use Docker-Compose to download and launch rDoD by using the following command:
```
docker-compose up
```

It's also possible to launch rDoD in "detach" mode by adding the -d parameter:
```
docker-compose up -d
```

#### b) Docker CLI
You can launch rDoD by using the classical Docker CLI. That way permit a better customization but will require to write a longer command line.
```
docker run -p 5901:5901 -p 5911:5911 mderasse/rdod:latest
```
Of course you can replace latest by another image tag.

You might also want to have a persistent Home. You can do this by using the parameter -v like :
```
docker run -p 5901:5901 -p 5911:5911 -v $(pwd)/home:/home/user mderasse/rdod:latest
```

You might also want to use those parameter :
* **-d** : launch the image in "detach" mode
* **-e** : set a environment variable. (-e USE_SSL='true')

### 3) Access to rDoD
rDoD currently provide 2 different ways of access.
#### VNC
In order to acces to rDoD by using VNC you will have to install the TigerVNC viewer.  
You can find the different binary depending of your OS on that link:  [TigerVNC Viewer](https://bintray.com/tigervnc/stable/tigervnc/1.9.0)

After the installation done you will have to launch the client and connect to :
YOUR_IP:5901

#### noVNC
noVNC is a HTML5 Client. You can access it directly by using your favorite Web Browser
[http://YOUR_IP:5911](http://YOUR_IP:5911)

Don't forget to change HTTP to HTTPS is USE_SSL is enabled


## Create you own Customized Version
Work In Progress

## Known Issues
1) noVNC does not handle well all the keyboard key
