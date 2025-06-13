FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:fish-shell/release-3 && \
    apt update && \
    apt install -y git curl fish sudo && \
    rm -rf /var/lib/apt/lists/*
RUN sh -c "$(curl -fsLS get.chezmoi.io/lb)"
COPY . /root/.local/share/chezmoi/

RUN chezmoi init --apply

ENV SHELL /usr/bin/fish
CMD ["fish"]
