FROM ubuntu:18.04

ARG SIRIUS_VERSION=6.1.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y apt-utils

RUN apt-get install -y gcc gfortran mpich git make cmake vim wget pkg-config valgrind

RUN apt-get install -y libblas-dev liblapack-dev libhdf5-dev libgsl-dev libxc-dev libfftw3-dev

RUN apt-get install -y automake automake1.11 autotools-dev libtool python pybind11-dev python3-pybind11

#RUN cd && git clone https://github.com/atztogo/spglib.git && cd spglib && mkdir _build && cd _build && cmake .. && make && make install

RUN cd && wget https://github.com/electronic-structure/SIRIUS/archive/$SIRIUS_VERSION.tar.gz && tar zxvf $SIRIUS_VERSION.tar.gz

RUN cd $HOME/SIRIUS-$SIRIUS_VERSION && CC=gcc CXX=gcc FC=gfortran FCCPP=cpp python prerequisite.py $HOME/local spg

RUN cd $HOME/SIRIUS-$SIRIUS_VERSION && mkdir _build && cd _build && LIBSPGROOT=$HOME/local cmake ../ -DBUILD_TESTS=1 -DCREATE_PYTHON_MODULE=1 -DCMAKE_INSTALL_PREFIX=$HOME/local/sirius

##RUN cd && git clone https://github.com/toxa81/SIRIUS.git
##
##COPY platform.docker.GNU.json /root/SIRIUS/platform.docker.GNU.json
##
##RUN cd /root/SIRIUS && python configure.py platform.docker.GNU.json && make
##
##RUN cd && git clone https://github.com/electronic-structure/q-e-sirius.git
##
##RUN cd /root/q-e-sirius && F90FLAGS='-I/root/SIRIUS/src -cpp -fopenmp -g' LD_LIBS='-fopenmp /root/SIRIUS/src/libsirius_f.a -llapack -lblas -lz -lgfortran -lstdc++ -lfftw3_threads -lgsl -lgslcblas -lxc -L/usr/local/lib -lsymspg -lhdf5_serial -Wl,-rpath,/usr/local/lib -lstdc++' ./configure && make pw
##
##COPY LiF /root/LiF
#
## overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
