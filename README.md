# rDoD (remote Desktop on Docker)

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

### 2) Start rDoD
Work In Progress

### 3) Access to rDoD
Work In Progress

## Create you own Customized Version
Work In Progress

## Known Issues
1) noVNC does not handle well all the keyboard key
