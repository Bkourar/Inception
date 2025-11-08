FROM debian:bookworm-slim

RUN apt-get -qq update -y && apt-get -q install --no-install-recommends adminer php php-curl php-cli php-mysql php-gd php-fpm -y && \
    apt remove apache2 -y && rm -rf /var/lib/apt/lists/* && \
    mv /usr/share/adminer/adminer.php /usr/share/adminer/index.php

CMD ["php", "-S", "[::]:1001", "-t", "/usr/share/adminer/"]
