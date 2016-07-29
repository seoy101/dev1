#easy Base Image

# base image
FROM ubuntu:14.04.1

# Maintainer 
MAINTAINER Stephen Newhouse stephen.j.newhouse@gmail.com

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Remain current
RUN apt-get update && apt-get dist-upgrade -y

# Basic dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  apt-utils \
  automake \
  ant \
  bash \
  binutils \
  perl \
  bioperl \
  build-essential \
  bzip2 \
  c++11 \
  cdbs \
  cmake \
  cron \
  curl \
  dkms \
  dpkg-dev \
  g++ \
  gpp \
  gcc \
  gfortran \
  git \
  git-core \
  libblas-dev \
  libatlas-dev \
  libbz2-dev \
  liblzma-dev \
  libpcre3-dev \
  libreadline-dev \
  make \
  mercurial \
  php5-curl \
  python python-dev python-yaml ncurses-dev zlib1g-dev python-numpy python-pip \
  sudo \
  subversion \
  tabix \
  tree \
  unzip \
  vim \
  wget \
  python-software-properties \
  libc-bin \
  llvm \
  libconfig-dev \
  ncurses-dev \
  zlib1g-dev \
  yum \
  libX11-dev libXpm-dev libXft-dev libXext-dev \
  asciidoc

#---------------------------------JAVA-------------------------------------------------------------------------------------#  
# upgrade java

RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections

RUN apt-get -y install oracle-java8-installer oracle-java8-set-default
#RUN apt-get install -y oracle-java8-installer
#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
#RUN apt-get install -y oracle-java8-set-default
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#RUN apt-get install -y openjdk-7-jdk openjdk-7-doc openjdk-7-jre-lib

#set java
#ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
#RUN sed -i 'aPATH=$PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/bin' /root/.bashrc

#-------------------------------Add user----------------------------------------------------------------------------------#
# Create a pipeline user:pipeman and group:ngsgroup

RUN useradd -m -s /bin/bash pipeman && \
  cd /home/pipeman && \
  echo "#bash config file for user pipeman" >> /home/pipeman/.bashrc

RUN groupadd ngsgroup && \
  usermod -aG ngsgroup pipeman && \
  usermod -aG sudo pipeman

#-----------------------------NGS TOOLS DIRECTORY------------------------------------------------------------------------#  
#make pipeline install dirs
RUN mkdir /usr/local/pipeline && \
  chown pipeman:ngsgroup /usr/local/pipeline && \
  chmod 775 /usr/local/pipeline
  
#-------------------------------PERMISSIONS--------------------------
RUN chmod -R 777 /usr/local/pipeline 
RUN chown -R pipeman:ngsgroup /usr/local/pipeline

#---------------------------------------------------------------------
#Cleanup the temp dir
RUN rm -rvf /tmp/*

#open ports private only
EXPOSE 8080

# Use baseimage-docker's bash.
CMD ["/bin/bash"]

#Clean up APT when done.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoclean && \
    apt-get autoremove -y && \
rm -rf /var/lib/{apt,dpkg,cache,log}/
