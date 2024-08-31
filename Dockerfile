# Build the C BMI example from a Mambaforge (Linux/Ubuntu) image.
FROM csdms/bmi:0.1.0

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV base_url=https://github.com/csdms
ENV package=bmi-example-c
ENV version="2.0.3"
ENV prefix=/opt/${package}

RUN git clone --branch v${version} ${base_url}/${package} ${prefix}
WORKDIR ${prefix}/_build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=${CONDA_DIR} && \
    make && \
    make test && \
    make install

WORKDIR /opt
