FROM ubuntu:vivid
MAINTAINER uggla@free.fr
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
apt-get install -y apt-utils && \
apt-get install -y golang && \
apt-get install -y golang && \
apt-get install -y wget && \
apt-get install -y vim && \
apt-get install -y apt-utils && \
apt-get install -y libgl1-mesa-glx
RUN useradd -k /etc/skel -m pa 
COPY auth_papatcher.sh /home/pa/auth_papatcher.sh
RUN chown pa:pa /home/pa/auth_papatcher.sh
USER pa
WORKDIR /home/pa
RUN wget https://bitbucket.org/papatcher/papatcher/raw/a7b8b4febb491d6fc6c45155b238fd42ee34fcc8/papatcher.go
RUN chmod +x /home/pa/auth_papatcher.sh && \
chmod +x /home/pa/papatcher.go && \
/home/pa/auth_papatcher.sh
