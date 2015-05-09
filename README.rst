PAServerDockerfile
==================

Dockerfile to build images for Planetary Annihilation Servers.

Note : this project is an early stage. Please report any issue to github bug tracker.

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
 

Build instructions
------------------
# Clone the repo with git.
# Change directory to the repository and run buildImage.sh.
# Answer the script questions.


Run instructions
----------------

