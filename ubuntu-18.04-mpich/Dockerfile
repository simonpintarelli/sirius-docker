FROM ubuntu:18.04
USER root

# install Ubuntu packages
RUN apt-get update && apt-get install -y \
  build-essential \
  ca-certificates \
  automake \
  autoconf \
  pkg-config \
  gfortran \
  python-dev \
  python3-dev \
  liblapack-dev \
  libfftw3-dev \
  libmpich-dev \
  python-dill \
  python3-dill \
  python-pip \
  python3-pip \
  python-numpy \
  python3-numpy \
  python-distutils-extra \
  python3-distutils-extra \
  python-setuptools \
  python3-setuptools \
  m4 \
  libtool \
  mpich \
  python \
  python3 \
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
RUN pip3 install mpi4py
RUN pip2 install mpi4py

# build toolchain
WORKDIR /opt/sirius/
COPY install_sirius.sh ./

COPY etc_profile_sirius.sh /etc/profile.d/00-sirius.sh
RUN echo "source /etc/profile.d/00-sirius.sh" >> /etc/bash.bashrc
RUN ./install_sirius.sh


WORKDIR /opt/sirius/
