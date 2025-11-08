FROM debian:bookworm-slim

RUN apt-get -qq update -y && apt-get -q install --no-install-recommends -y net-tools redis-server && \
    rm -rf /var/lib/apt/lists/*

COPY --chmod=444 conf/redis_conf /etc/redis/redis.conf

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]
