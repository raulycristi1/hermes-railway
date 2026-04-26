FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl git tmux xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN pip install "git+https://github.com/NousResearch/hermes-agent.git"

COPY config.yaml /root/.hermes/config.yaml
COPY .env /root/.hermes/.env

CMD ["hermes", "gateway", "run"]
