FROM quay.io/modh/odh-pytorch-notebook:v3-20250808

USER root

RUN dnf install -y \
    ca-certificates \
    cmake \
    dos2unix \
    bc && \
    dnf clean all

RUN pip install --no-cache-dir \
    bash_kernel \
    "nglview==3.1.4"

RUN python -m bash_kernel.install

USER 1001