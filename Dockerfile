FROM ubuntu:vivid
MAINTAINER uggla@free.fr
EXPOSE 20545
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
apt-get install -y apt-utils && \
apt-get install -y golang && \
apt-get install -y nodejs && \
apt-get install -y wget && \
apt-get install -y vim && \
apt-get install -y unzip && \
apt-get install -y libgl1-mesa-glx
RUN useradd -k /etc/skel -m pa 
COPY auth_papatcher.sh /home/pa/auth_papatcher.sh
COPY NodePAMaster_conf.json /home/pa/NodePAMaster_conf.json
COPY update_conf_file.sh /home/pa/update_conf_file.sh
COPY *.sed /home/pa/
RUN chown pa:pa /home/pa/auth_papatcher.sh && \
chown pa:pa /home/pa/update_conf_file.sh && \
chown pa:pa /home/pa/NodePAMaster_conf.json && \
chown pa:pa /home/pa/*.sed
USER pa
WORKDIR /home/pa
RUN wget https://bitbucket.org/papatcher/papatcher/raw/a7b8b4febb491d6fc6c45155b238fd42ee34fcc8/papatcher.go && \
wget http://nanodesu.info/stuff/pa/mods/NodePAMaster.zip && \
wget https://dl.dropboxusercontent.com/u/28565393/Planetary%20Annihilation/colours/color_table.js
RUN chmod +x /home/pa/auth_papatcher.sh && \
chmod +x /home/pa/papatcher.go && \
unzip /home/pa/NodePAMaster.zip && \
/home/pa/auth_papatcher.sh && \
cp color_table.js ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script/lobby/color_table.js
