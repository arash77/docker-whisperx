# Base image with PyTorch + CUDA 12.1 + cuDNN 8 runtime
FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# update torch with the latest version
RUN pip install --no-cache-dir --upgrade torch torchvision torchaudio \
    --extra-index-url https://download.pytorch.org/whl/cu121

RUN pip install --no-cache-dir whisperx==3.4.2 && \
    rm -rf /root/.cache/ && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*
