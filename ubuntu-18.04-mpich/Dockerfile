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
  python-mpi4py \
  python-dill \
  python3-mpi4py \
  python3-dill \
  python-numpy \
  python3-numpy \
  python-distutils-extra \
  python3-distutils-extra \
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

# ENV MPICH_SHA "329ee02fe6c3d101b6b30a7b6fb97ddf6e82b28844306771fa9dd8845108fa0b mpich-3.3.tar.gz"
# # https://user.cscs.ch/scientific_computing/supported_applications/shifter/advanced_shifter/#native-mpi-support
# RUN wget -q http://www.mpich.org/static/downloads/3.3/mpich-3.3.tar.gz \
#   && (echo "${MPICH_SHA}" | sha256sum -c -) \
#   && tar xf mpich-3.3.tar.gz \
#   && cd mpich-3.3 \
#   && ./configure --enable-fast=all,O3 --prefix=/usr \
#   && make -j \
#   && make install \
#   && ldconfig \
#   && cd .. \
#   && rm -rf mpich-3.3 \
#   && rm mpich-3.3.tar.gz

# build toolchain
WORKDIR /opt/sirius/
COPY install_sirius.sh ./

# COPY install_cp2k_toolchain.sh ./
COPY etc_profile_sirius.sh /etc/profile.d/00-sirius.sh
RUN echo "source /etc/profile.d/00-sirius.sh" >> /etc/bash.bashrc
RUN ./install_sirius.sh

# # configure shell
# RUN ln -sf bash /bin/sh && \
#     echo "source /opt/cp2k-toolchain/install/setup" >> /etc/bash.bashrc

WORKDIR /opt/sirius/
