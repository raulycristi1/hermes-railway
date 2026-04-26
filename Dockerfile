FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl git tmux xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

COPY config.yaml /root/.hermes/config.yaml
COPY .env /root/.hermes/.env

CMD ["bash", "-c", "HERMES_SKIP_SETUP=1 curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash < /dev/null; exec /usr/local/bin/hermes gateway run"]
