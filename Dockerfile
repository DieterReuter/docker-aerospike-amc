# Dockerfile for AeroSpike AMC 
# http://www.aerospike.com/aerospike-monitoring-console/

FROM ubuntu:14.04
MAINTAINER Dieter Reuter <dieter.reuter@me.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" > /etc/apt/sources.list
RUN apt-get -yy update
RUN apt-get -yy upgrade


# install AMC deps
RUN apt-get -yy install build-essential python-dev python-pip man
RUN apt-get -yy install wget

# install AMC
RUN wget -O amc.deb http://www.aerospike.com/download/amc/3.4.5/artifact/ubuntu12 && \
    dpkg -i amc.deb && \
    rm amc.deb

# use AMC webport 8081/tcp
EXPOSE 8081

# launch AMC
CMD ["/opt/amc/bin/start_amc_cron.sh"]
