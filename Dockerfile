# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# Build in non-interactive mode for online continuous building
ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -u 528751  -d /home/genepatt -s /bin/bash genepatt

USER genepatt 

# Set the working directory to /app
WORKDIR /home/genepatt

#Copy AA and mosek to image
RUN mkdir -p /home/genepatt/programs

USER root

#Download libraries for AA
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository universe -y
RUN apt-get install -y python2
ADD https://bootstrap.pypa.io/pip/2.7/get-pip.py /home/genepatt/
RUN python2 get-pip.py
RUN python2 -m pip install --upgrade "pip < 21.0"
RUN apt-get update && apt-get install -y
RUN apt-get install libbz2-dev liblzma-dev gfortran zlib1g-dev samtools bash wget tar unzip curl -y
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 10
#RUN update-alternatives --config python
RUN pip2 install Cython numpy scipy matplotlib pysam==0.15.2 Flask

USER genepatt

RUN cd /home/genepatt/programs && wget http://download.mosek.com/stable/8.0.0.60/mosektoolslinux64x86.tar.bz2
RUN cd /home/genepatt/programs && tar xf mosektoolslinux64x86.tar.bz2
# ADD mosek.lic /home/genepatt/programs/mosek/8/licenses/mosek.lic

RUN mkdir -p /home/genepatt/output/
RUN mkdir -p /home/genepatt/input/
RUN mkdir -p /home/genepatt/programs/mosek/8/licenses/


#Set environmental variables

RUN echo export MOSEKPLATFORM=linux64x86 >> ~/.bashrc
RUN export MOSEKPLATFORM=linux64x86
RUN echo export PATH=$PATH:/home/genepatt/programs/mosek/8/tools/platform/$MOSEKPLATFORM/bin >> ~/.bashrc
RUN echo export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/genepatt/programs/mosek/8/tools/platform/$MOSEKPLATFORM/bin >> ~/.bashrc
RUN echo export MOSEKLM_LICENSE_FILE=/home/genepatt/programs/mosek/8/licenses >> ~/.bashrc

USER root
RUN cd /home/genepatt/programs/mosek/8/tools/platform/linux64x86/python/2/ && python2 setup.py install
RUN chmod -R a+rwx /home/genepatt/programs/mosek/8/
USER genepatt

RUN echo export AA_DATA_REPO=/home/genepatt/data_repo >> ~/.bashrc

# custom things at the end 
RUN mkdir -p /home/genepatt/testdata/
RUN mkdir -p /home/genepatt/AA/
RUN mkdir -p /home/genepatt/data_repo/
COPY src/* /home/genepatt/AA/
COPY lic/* /home/genepatt/programs/mosek/8/licenses/
COPY zip/* /home/genepatt/data_repo/
COPY scripts/* /home/genepatt/
# testing purposes only
# COPY testdata/* /home/genepatt/testdata/
USER root
RUN chown genepatt:genepatt /home/genepatt/programs/mosek/8/licenses/mosek.lic
RUN chmod -R a+w /home/genepatt/programs/mosek/8/licenses/
RUN chown genepatt:genepatt /home/genepatt/run_aa_script.sh

USER genepatt

