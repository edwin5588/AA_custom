# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# Build in non-interactive mode for online continuous building
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /opt/genepatt && \
    chmod a+rwx /opt/genepatt 
   
# Set the working directory to /app
WORKDIR /opt/genepatt

#Copy AA and mosek to image
RUN mkdir -p /opt/genepatt/programs


#Download libraries for AA
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository universe -y
RUN apt-get install -y python2
ADD https://bootstrap.pypa.io/pip/2.7/get-pip.py /opt/genepatt/
RUN python2 get-pip.py
RUN python2 -m pip install --upgrade "pip < 21.0"
RUN apt-get update && apt-get install -y
RUN apt-get install libbz2-dev liblzma-dev gfortran zlib1g-dev samtools bash wget tar unzip curl -y
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 10
#RUN update-alternatives --config python
RUN pip2 install Cython numpy scipy matplotlib pysam==0.15.2 Flask

RUN cd /opt/genepatt/programs && wget http://download.mosek.com/stable/8.0.0.60/mosektoolslinux64x86.tar.bz2
RUN cd /opt/genepatt/programs && tar xf mosektoolslinux64x86.tar.bz2
# ADD mosek.lic /genepatt/programs/mosek/8/licenses/mosek.lic

RUN mkdir -p /opt/genepatt/output/
RUN mkdir -p /opt/genepatt/input/
RUN mkdir -p /opt/genepatt/programs/mosek/8/licenses/


#Set environmental variables
ENV MOSEKPLATFORM=linux64x86 
ENV PATH="$PATH:/opt/genepatt/programs/mosek/8/tools/platform/$MOSEKPLATFORM/bin"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/genepatt/programs/mosek/8/tools/platform/$MOSEKPLATFORM/bin"
ENV MOSEKLM_LICENSE_FILE=/opt/genepatt/programs/mosek/8/licenses 

RUN cd /opt/genepatt/programs/mosek/8/tools/platform/linux64x86/python/2/ && python2 setup.py install
RUN chmod -R a+rwx /opt/genepatt/programs/mosek/8/

ENV AA_DATA_REPO /opt/genepatt/data_repo 

# custom things at the end 
RUN mkdir -p /opt/genepatt/testdata/
RUN mkdir -p /opt/genepatt/AA/
RUN mkdir -p /opt/genepatt/data_repo/
COPY src/* /opt/genepatt/AA/
COPY lic/* /opt/genepatt/programs/mosek/8/licenses/
COPY zip/* /opt/genepatt/data_repo/
COPY scripts/* /opt/genepatt/

RUN chmod -R a+rwx /opt/genepatt/programs/mosek/8/licenses/


