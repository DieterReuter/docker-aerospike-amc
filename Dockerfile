# Dockerfile for AeroSpike AMC 
# http://www.aerospike.com/aerospike-monitoring-console/

FROM ubuntu:14.04
MAINTAINER Dieter Reuter <dieter.reuter@me.com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" > /etc/apt/sources.list
RUN apt-get -yy update
RUN apt-get -yy upgrade


# install tools
RUN apt-get -yy install wget curl git-core

# install AMC deps
RUN apt-get -yy install build-essential python-dev python-pip man

# install AMC
RUN wget -O amc.deb http://www.aerospike.com/download/amc/3.4.5/artifact/ubuntu12 && \
    dpkg -i amc.deb && \
    rm amc.deb

# use AMC webport 8081/tcp
EXPOSE 8081

# install supervisor
RUN apt-get -yy install supervisor

# copy our supervisor service definition
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# launch AMC
CMD ["/usr/bin/supervisord"]
