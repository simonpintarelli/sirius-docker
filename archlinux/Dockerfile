FROM archlinux/base:latest

RUN pacman --noconfirm -Sy archlinux-keyring && pacman-key --init && pacman-key --populate archlinux
RUN pacman -Sy --noconfirm --need base-devel git
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN /usr/bin/groupadd --system sudo && \
  /usr/sbin/useradd -m --groups sudo user
USER user
RUN mkdir -p /tmp/install && cd /tmp/install  && \
  git clone https://aur.archlinux.org/pikaur.git && cd pikaur && makepkg -fsri --noconfirm
RUN pikaur --aur -Sy --noconfirm libxc spglib-git python-spglib scalapack openblas-lapack
RUN pikaur -Sy --noconfirm gcc-fortran cmake ipython jupyter

USER user
RUN mkdir -p /tmp/sirius
COPY --chown=user sirius-pkgbuild/PKGBUILD /tmp/sirius/
RUN cd /tmp/sirius && makepkg -fsri --noconfirm

USER root
ENV PYTHONPATH=/usr/local/lib/python3.7/site-packages
