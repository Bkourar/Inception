FROM debian:bookworm-slim

RUN apt-get -qq update -y && apt-get -q -y --no-install-recommends install wget tar git ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/portainer/portainer/releases/download/2.33.2/portainer-2.33.2-linux-amd64.tar.gz && \
    tar xzf portainer-2.33.2-linux-amd64.tar.gz && \
    rm portainer-2.33.2-linux-amd64.tar.gz

EXPOSE 9443

CMD ["/portainer/portainer", "--data", "/data"]

