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
  python3 \
  python3-dev \
  python3-dill \
  python3-pip \
  python3-numpy \
  python3-distutils-extra \
  python3-setuptools \
  m4 \
  vim \
  libtool \
  libopenmpi-dev \
  wget \
  cmake \
  cmake-data \
  git \
  libxc-dev \
  libgsl-dev \
  libhdf5-serial-dev \
  flex \
  flexc++ \
  python3-mpi4py \
  less \
  unzip \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# build toolchain
WORKDIR /opt/
COPY install_sirius.sh ./

COPY etc_profile_sirius.sh /etc/profile.d/00-sirius.sh
RUN echo "source /etc/profile.d/00-sirius.sh" >> /etc/bash.bashrc
RUN echo "source /opt/i-pi/env.sh" >> /etc/bash.bashrc
RUN ./install_sirius.sh

WORKDIR /opt/sirius
