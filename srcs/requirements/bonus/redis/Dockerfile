FROM debian:bookworm
RUN apt -qq upgrade -y && apt -qq update -y && apt -q install vim net-tools redis-server -y
###
COPY --chmod=444 conf/redis_conf /etc/redis/redis.conf
###
CMD ["redis-server", "/etc/redis/redis.conf"]
