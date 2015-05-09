PAServerDockerfile
==================

Dockerfile to build images for Planetary Annihilation Servers.

Note : this project is in an early stage. Please report any issue or comment to github bug tracker :
https://github.com/uggla/PAServerDockerfile/issues

PAServer documentation source
-----------------------------
PA server installation procedure is available at `EXODUS ESPORTS <http://exodusesports.com/guides/planetary-annihilation-dedicated-server-setup>`_.

The dockerfile will try to automate and produce a system configuration similar as the above procedure.

* Variation from the initial procedure
** Installation in a docker image to easily deploy new servers and improve security.
** Operating system changed to latest Ubuntu image 15.04 (Vivid Vervet), intead of 14.04 (Trusty Tahr).
** Image use colors from 


Prerequisites
-------------
* Install docker.
* Update sudoers to avoid enter your password each time (optional).
 

Building instructions
---------------------
# Clone the repo with git.
# Change directory to the repository and run buildImage.sh.
# Answer script questions.
Have a coffee. Image is ~5 GB, so time for building depends from your internet bandwidth.


Running instructions
--------------------
Run a container to start pa server.
Attach

Stop

Modifying image content
-----------------------

