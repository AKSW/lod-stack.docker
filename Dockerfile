####
#
# Dockerfile to provide a single container Linked Data Stack
#
####

FROM ubuntu:12.04
MAINTAINER Sebastian Tramp <tramp@informatik.uni-leipzig.de>
MAINTAINER Bert Van Nuffelen <bert.van.nuffelen@tenforce.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# update ubuntu 
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget

WORKDIR /root
# provisioning as described at http://stack.linkeddata.org/download-and-install/
# download the repository package
RUN wget http://stack.linkeddata.org/ldstable-repository.deb
# install the repository package
RUN dpkg -i ldstable-repository.deb
# update the repository database
RUN apt-get update
# install lod2-virtuoso-opensource
RUN apt-get -y install lod2-virtuoso-opensource

# RUN apt-get -y install ontowiki-virtuoso
RUN apt-get -y install spatial-semantic-browser
RUN apt-get -y install dbpedia-spotlight-ui
RUN apt-get -y install lod2demo

# to ensure that all configuration changes are applied
RUN service tomcat6 restart


EXPOSE 80
EXPOSE 1111
EXPOSE 8890

# CMD /root/start.sh
