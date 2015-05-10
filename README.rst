PAServerDockerfile
==================
Dockerfile to build images for Planetary Annihilation Servers.

:Note: This project is in an **early stage**.

   Please report any issue or comment to github bug tracker :
   https://github.com/uggla/PAServerDockerfile/issues


PAServer documentation source
-----------------------------
PA server installation procedure is available at `EXODUS ESPORTS <http://exodusesports.com/guides/planetary-annihilation-dedicated-server-setup>`_.

The dockerfile will try to automate and produce a system configuration similar as the result of above procedure.


Variations from the initial procedure :


- Installation uses a docker image to easily deploy new servers and improve security.
- Operating system changed to latest Ubuntu image 15.04 (Vivid Vervet), instead of 14.04 (Trusty Tahr).
- A non privileged user **pa** is created to run pa server.
- Image uses colors produced by burntcustard by default.


Prerequisites
-------------
- Use your regular user to build the image.
- Recent docker, image was successfully built on :

    - Fedora 21
    docker --version
    ::
       Docker version 1.6.0, build 350a636/1.6.0
 
   
    - Ubuntu 15.04 with some minor defects_.
    docker --version
    ::
       Docker version 1.5.0, build a8a31ef

- Install docker.
 Example :
 sudo apt-get install docker.io
 
 or
 
 sudo yum install docker.io
- Add a rule into /etc/sudoers to avoid entering your password each time (optional).
 <user-name>	ALL=(ALL)	NOPASSWD: /usr/bin/sudo
- Add an alias to your .bashrc not enter your sudo password each time (optional).
 alias docker=”sudo docker”
- Open port **20545** on your server firewall. Do not forget your firewall router, if you have one in between. 
 Example with firewalld :
 
 firewall-cmd --add-port 20545/tcp
 
Building instructions
---------------------
1. Clone the repo with git.
 git clone https://github.com/uggla/PAServerDockerfile.git
2. Change directory to the repository and run buildImage.sh.
 cd PAServerDockerfile
 
 ./buildImage.sh
3. Answer script questions.

   - Enter PA username  --> Uber login
   - Enter PA password  --> Uber password
   - Enter Server IP (default : 127.0.0.0) --> public ip of your server
   - Enter Server Name  --> server name as it will appear in the lobby
   - Enter Server Region --> server region as it will appear in the lobby
   - List on PAstats (y/n)  --> yes if you want to see your server advertised in PA lobby


 
4. Time to have a coffee. Image is ~5 GB, so time for building depends from your internet connection.


Running instructions
--------------------
- Run a container to start pa server.
 docker run -ti -d --name=paserver -p 20545:20545 uggla/paserver

- Show running container.

 [uggla@uggla PAServerDockerfile]$ docker ps
 ::
    CONTAINER ID        IMAGE                   COMMAND                CREATED             STATUS              PORTS                      NAMES
    6f43c00fea2d        uggla/paserver:latest   "/usr/bin/nodejs ./N   5 hours ago         Up 9 seconds        0.0.0.0:20545->20545/tcp   paserver            



- Start an already existing container.
 docker start paserver
 
- Attach to the container console to show logs.
 docker attach paserver
 
 Note : ctrl p ctrl q to detach from container.

- Stop your server.
 docker stop paserver

Modifying container content
---------------------------
- You can edit the container to modify options.
 sudo docker run -u root --entrypoint="/bin/bash" -ti --name "paserver" uggla/paserver
 
Ubuntu 15.04 minor defects
--------------------------
.. _defects:

- Warnings are displayed about label.
 # Skipping unknown instruction LABEL
 
- Papatcher does not display progress
