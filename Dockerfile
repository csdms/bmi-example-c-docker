# Build the C BMI example from a Mambaforge (Linux/Ubuntu) image.
FROM condaforge/mambaforge:24.3.0-0

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

RUN mamba install -y -c conda-forge make cmake c-compiler pkg-config

ENV base_url=https://github.com/csdms

# There's no linux/arm64 build of bmi-c on conda-forge, so build it here.
ENV package=bmi-c
ENV version="2.1.2"
ENV prefix=/opt/${package}
RUN git clone --branch v${version}  ${base_url}/${package} ${prefix}
WORKDIR ${prefix}/_build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=${CONDA_DIR} && \
    make && \
    make install

ENV package=bmi-example-c
ENV version="2.0.3"
ENV prefix=/opt/${package}
RUN git clone --branch v${version}  ${base_url}/${package} ${prefix}
WORKDIR ${prefix}/_build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=${CONDA_DIR} && \
    make && \
    make test && \
    make install

WORKDIR /opt
