# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# Build in non-interactive mode for online continuous building
ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -d /home/genepatt/ -s /bin/bash genepatt
RUN mkdir /genepatt && \
    chmod a+rwx /genepatt && \
    chown genepatt:genepatt /genepatt
   


USER genepatt 


# Set the working directory to /app
WORKDIR /genepatt

#Copy AA and mosek to image
RUN mkdir -p /genepatt/programs

USER root

#Download libraries for AA
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository universe -y
RUN apt-get install -y python2
ADD https://bootstrap.pypa.io/pip/2.7/get-pip.py /genepatt/
RUN python2 get-pip.py
RUN python2 -m pip install --upgrade "pip < 21.0"
RUN apt-get update && apt-get install -y
RUN apt-get install libbz2-dev liblzma-dev gfortran zlib1g-dev samtools bash wget tar unzip curl -y
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 10
#RUN update-alternatives --config python
RUN pip2 install Cython numpy scipy matplotlib pysam==0.15.2 Flask

USER genepatt

RUN cd /genepatt/programs && wget http://download.mosek.com/stable/8.0.0.60/mosektoolslinux64x86.tar.bz2
RUN cd /genepatt/programs && tar xf mosektoolslinux64x86.tar.bz2
# ADD mosek.lic /genepatt/programs/mosek/8/licenses/mosek.lic

RUN mkdir -p /genepatt/output/
RUN mkdir -p /genepatt/input/
RUN mkdir -p /genepatt/programs/mosek/8/licenses/


#Set environmental variables
ENV MOSEKPLATFORM=linux64x86 
ENV PATH="$PATH:/genepatt/programs/mosek/8/tools/platform/$MOSEKPLATFORM/bin"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/genepatt/programs/mosek/8/tools/platform/$MOSEKPLATFORM/bin"
ENV MOSEKLM_LICENSE_FILE=/genepatt/programs/mosek/8/licenses 

USER root
RUN cd /genepatt/programs/mosek/8/tools/platform/linux64x86/python/2/ && python2 setup.py install
RUN chmod -R a+rwx /genepatt/programs/mosek/8/
USER genepatt

ENV AA_DATA_REPO /genepatt/data_repo 

# custom things at the end 
RUN mkdir -p /genepatt/testdata/
RUN mkdir -p /genepatt/AA/
RUN mkdir -p /genepatt/data_repo/
COPY src/* /genepatt/AA/
COPY lic/* /genepatt/programs/mosek/8/licenses/
COPY zip/* /genepatt/data_repo/
COPY scripts/* /genepatt/

USER root
RUN chown genepatt:genepatt /genepatt/programs/mosek/8/licenses/mosek.lic
RUN chmod -R a+rwx /genepatt/programs/mosek/8/licenses/
RUN chown genepatt:genepatt /genepatt/run_aa_script.sh

USER genepatt

