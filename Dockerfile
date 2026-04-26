FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl git tmux xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN pip install "git+https://github.com/NousResearch/hermes-agent.git" python-telegram-bot

COPY config.yaml /root/.hermes/config.yaml

CMD ["hermes", "gateway", "run"]
