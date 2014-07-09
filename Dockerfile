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
RUN wget http://stack.lod2.eu/deb/lod2testing-repository.deb
# install the repository package
RUN dpkg -i lod2testing-repository.deb
# update the repository database
RUN apt-get update

# set default answers to deployment questions by packages to a temp file 
ADD lod2debconfiguration /tmp/lod2debconfiguration
RUN debconf-set-selections /tmp/lod2debconfiguration 
RUN apt-get -y install lod2demo

EXPOSE 80
EXPOSE 1111
EXPOSE 8890

# CMD /root/start.sh
# After deployment we have to update the root pwd of Virtuoso both in the server as in the bd.ini file
