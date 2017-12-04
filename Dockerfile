FROM ubuntu:16.04
MAINTAINER Barry Warsaw <barry@python.org>

# Enable source repositories so we can use `apt build-dep` to get all the
# build dependencies for Python 2.7 and 3.5.
RUN sed -i -- 's/#deb-src/deb-src/g' /etc/apt/sources.list
RUN sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list

# Update Xenial and install the build-deps
RUN apt update && apt dist-upgrade --yes
RUN apt build-dep --yes python2.7 && apt build-dep --yes python3.5

# Installing tox should give us everything else we need.  Do we need a newer
# version of tox?
RUN apt install --yes git python-tox python3-pip wget curl

# For the qa test.
RUN pip3 install mypy
# For codecov.io
RUN pip3 install codecov

# Add a new user
RUN useradd runner --create-home

# Create and change permissions for builds directory
RUN mkdir /builds
RUN chown runner /builds

# Set password for runner user and make it visible for SSH
# This section is probably not needed now, but it is required
# if you need to SSH in using this user
# RUN echo 'runner:runner' | chpasswd
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile

RUN export LC_ALL=C.UTF-8 && export LANG=C.UTF-8

# Install Python 3.7 from git head.
WORKDIR /tmp/
RUN git clone https://github.com/python/cpython.git
WORKDIR /tmp/cpython
RUN ./configure && make && make altinstall

WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
RUN tar xzf Python-3.6.3.tgz
WORKDIR /tmp/Python-3.6.3
RUN ./configure && make && make altinstall

WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/3.5.4/Python-3.5.4.tgz
RUN tar xzf Python-3.5.4.tgz
WORKDIR /tmp/Python-3.5.4
RUN ./configure && make && make altinstall

WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/3.4.6/Python-3.4.6.tgz
RUN tar zxf Python-3.4.6.tgz
WORKDIR /tmp/Python-3.4.6
RUN ./configure && make && make altinstall

WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
RUN tar zxf Python-2.7.13.tgz
WORKDIR /tmp/Python-2.7.13
RUN ./configure && make && make altinstall

# Switch to runner user and set the workdir
USER runner
WORKDIR /home/runner
