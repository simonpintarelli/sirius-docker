#!/bin/bash

git clone --recursive https://github.com/simonpintarelli/SIRIUS.git -b feature/baarman-direct-minimization
(
    cd SIRIUS
    mkdir -p external && \
        python prerequisite.py $(realpath external) spg


    mkdir -p build && \
        (
            # make sure SIRIUS finds SPG, other libs are in standard path
            export LIBSPGROOT=/opt/SIRIUS/external

            cd build
            cmake -DCMAKE_BUILD_TYPE=Release \
                  -DCREATE_PYTHON_MODULE=On \
                  ../
            make install && rm -rf build && \
                echo "Installed SIRIUS binaries to /usr/local/bin"
            echo 'export PYTHONPATH=/usr/local/lib/python3.7/site-packages:${PYTHONPATH}' >> /etc/bash.bashrc
        )
)
