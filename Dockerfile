FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl git tmux xz-utils && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

ENV PATH="/root/.local/bin:/usr/local/bin:$PATH"

CMD ["hermes", "gateway", "run"]
