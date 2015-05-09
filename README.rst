PAServerDockerfile
==================
Dockerfile to build images for Planetary Annihilation Servers.

Note : this project is in an early stage. Please report any issue or comment to github bug tracker :
https://github.com/uggla/PAServerDockerfile/issues


PAServer documentation source
-----------------------------
PA server installation procedure is available at `EXODUS ESPORTS <http://exodusesports.com/guides/planetary-annihilation-dedicated-server-setup>`_.

The dockerfile will try to automate and produce a system configuration similar as the above procedure.


Variation from the initial procedure :


- Installation uses a docker image to easily deploy new servers and improve security.
- Operating system changed to latest Ubuntu image 15.04 (Vivid Vervet), instead of 14.04 (Trusty Tahr).
- Image use colors produced by burntcustard by default.


Prerequisites
-------------
- Install docker.
 Example :
 sudo apt-get install docker.io
 or
 yum install docker.io
- Add a rule into /etc/sudoers to avoid enter your password each time (optional).
 user	ALL=(ALL)	NOPASSWD: /usr/bin/sudo
- Add an alias to your .bashrc not enter sudo each time (optional).
 Alias docker=”sudo docker”
- Open port **20545** on your server firewall. Do not forget your firewall router, if you have one in between. 
 Example with firewalld :
 firewall-cmd --add-port 20545/tcp
 
Building instructions
---------------------
1. Clone the repo with git.
 git clone git@github.com:uggla/PAServerDockerfile.git
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

Attach to the container console to show logs.
 

Stop your server.
 docker stop paserver

Modifying container content
---------------------------
