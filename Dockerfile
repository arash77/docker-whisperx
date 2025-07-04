# Base image with PyTorch + CUDA 12.1 + cuDNN 8 runtime
FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        libsndfile1 \
        libcudnn8 \
        libcudnn8-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir whisperx==3.4.2 && \
    rm -rf /root/.cache/ && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*
