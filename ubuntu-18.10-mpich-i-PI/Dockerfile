FROM ubuntu:18.10
USER root

# install Ubuntu packages
RUN apt-get update && apt-get install -y \
  build-essential \
  ca-certificates \
  automake \
  autoconf \
  pkg-config \
  gfortran \
  liblapack-dev \
  libfftw3-dev \
  libmpich-dev \
  python \
  python-dev \
  python-dill \
  python-pip \
  python-numpy \
  python-distutils-extra \
  python-setuptools \
  m4 \
  vim \
  libtool \
  mpich \
  wget \
  cmake \
  cmake-data \
  git \
  libxc-dev \
  libgsl-dev \
  libhdf5-serial-dev \
  flex \
  flexc++ \
  less \
  unzip \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*


# install mpi4py via pip, since official ubuntu packages are only for openmpi
RUN pip2 install mpi4py

# build toolchain
WORKDIR /opt/
COPY install_sirius.sh ./

COPY etc_profile_sirius.sh /etc/profile.d/00-sirius.sh
RUN echo "source /etc/profile.d/00-sirius.sh" >> /etc/bash.bashrc
RUN echo "source /opt/i-pi/env.sh" >> /etc/bash.bashrc
RUN ./install_sirius.sh

WORKDIR /opt/i-pi
