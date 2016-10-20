FROM ubuntu:16.04

MAINTAINER "James Fairbanks" <james.fairbanks@gtri.gatech.edu>

#Install oracle java prerequisites
RUN apt-get update -y                                                               \
    && apt-get install -y software-properties-common python-software-properties     \
    && add-apt-repository ppa:webupd8team/java

# Install oracle java for the LEAN Library not necessarily necessary anymore
RUN apt-get update -qq && apt-get upgrade -qq -y                                    \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true  \
            | /usr/bin/debconf-set-selections

# Install what we can from with APT
RUN apt-get install -qq -y \
                ant                         \
                apache2                     \
                cmake                       \
                curl                        \
                cython                      \
                gfortran                    \
                git                         \
                jq                          \
                libapache2-mod-wsgi         \
                libevent-dev                \
                mongodb-server              \
                oracle-java8-installer      \
                oracle-java8-set-default    \
                python-dev                  \
                python-numpy                \
                python-scipy                \
                python-psycopg2             \
                python-virtualenv           \
                ssh                         \
                unzip                       \
                wget                        \
                vim
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

# Binaries built with checkmake of bedrock libraries.
COPY packages /opt/pkg

RUN dpkg -i /opt/pkg/libelemental_0.84-p1-1_amd64.deb \
            /opt/pkg/libflame_5.0-4648_amd64.deb      \
            /opt/pkg/libopenblas_0.2.9-1_amd64.deb    \
            /opt/pkg/openmpi_1.8.1-1_amd64.deb


# Copy over and install the python requirements
COPY ./requirements.txt /requirements.txt
RUN pip install -U pip && hash -r && pip install -r /requirements.txt
