FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl git tmux xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN HERMES_SKIP_SETUP=1 curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

ENV PATH="/root/.local/bin:/usr/local/bin:$PATH"

CMD ["hermes", "gateway", "run"]
