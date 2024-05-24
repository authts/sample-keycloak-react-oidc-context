FROM mcr.microsoft.com/devcontainers/typescript-node:1-20-bookworm

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh
