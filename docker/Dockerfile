FROM nvidia/cuda:12.1.0-devel-ubuntu20.04

ENV LANG C.UTF-8
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# Install wget to fetch Miniconda
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda on x86 or ARM platforms
RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"; \
    elif [ "$arch" = "aarch64" ]; then \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"; \
    else \
    echo "Unsupported architecture: $arch"; \
    exit 1; \
    fi && \
    wget $MINICONDA_URL -O miniconda.sh && \
    mkdir -p /root/.conda && \
    bash miniconda.sh -b -p /root/miniconda3 && \
    rm -f miniconda.sh
RUN apt-get update -y
RUN apt-get install -y libx11-dev
RUN apt-get install -y python3-tk
RUN conda init

RUN apt install -y libosmesa6-dev libgl1-mesa-glx libglfw3 patchelf
# Create a working directory
WORKDIR /workspace

RUN cd /workspace && git clone https://github.com/karthiknambiar29/diffusion_policy.git

RUN cd /workspace && conda env create -f conda_environment.yaml



