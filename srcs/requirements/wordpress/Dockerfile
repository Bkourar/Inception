FROM debian:bookworm-slim
RUN apt-get -qq update -y && apt-get -q install curl net-tools wget php-redis less php php-fpm php-mysql -y && \
apt remove apache2 -y && rm -rf /var/lib/apt/lists/*

COPY --chmod=444 conf/php-fcgi /etc/php/8.2/fpm/pool.d/www.conf
COPY --chmod=744 tools/up /up_sh

EXPOSE 9000

ENTRYPOINT ["/up_sh"]
