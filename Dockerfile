# Build the C BMI example from a Mambaforge (Linux/Ubuntu) image.
FROM condaforge/mambaforge:24.3.0-0

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV prefix=/opt/bmi-example-c
ENV version="2.0.3"

RUN mamba install -y make cmake c-compiler pkg-config bmi-c

RUN git clone --branch v${version}  https://github.com/csdms/bmi-example-c ${prefix}
WORKDIR ${prefix}/_build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=${CONDA_DIR} && \
    make && \
    make test && \
    make install
WORKDIR /opt
