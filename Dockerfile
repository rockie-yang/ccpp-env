FROM ubuntu:20.04

ENV VERSION=3.9.1

# Install system packages
RUN apt-get update \
    && apt-get install -y curl vim g++ rsync zip openssh-server cmake 

# install lapack related packages
RUN apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran

# get lapack source code
RUN curl https://codeload.github.com/Reference-LAPACK/lapack/tar.gz/refs/tags/v3.9.1 -o lapack.tar.gz

# unzip lapack source code and put it in /usr/local/lapack
RUN  tar xzf lapack.tar.gz -C /usr/local/ \
    && ln -s /usr/local/lapack-${VERSION}/ /usr/local/lapack

# make lapack
RUN cd /usr/local/lapack \
    && cp make.inc.example make.inc \
    && make 

# make lapacke
RUN cd /usr/local/lapack/LAPACKE \
    && make 

# configure SSH for communication with Visual Studio 
RUN mkdir -p /var/run/sshd

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \ 
    ssh-keygen -A 

# expose port 22 
EXPOSE 22