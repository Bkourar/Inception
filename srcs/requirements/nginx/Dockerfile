FROM debian:bookworm-slim
RUN apt-get -qq update -y && apt-get -q install --no-install-recommends net-tools nginx openssl -y && \
	rm -rf /var/lib/apt/lists/*

COPY conf/default /etc/nginx/sites-available/
COPY --chmod=744 tools/nginx_sh /

RUN mkdir -p /etc/nginx/certs/ && \
	openssl req -nodes -x509 -newkey rsa:4096 \
	-keyout /etc/nginx/certs/certificate.key \
	-out /etc/nginx/certs/certificate.crt -days 365 \
	-subj "/C=MA/O=42/OU=Inception/CN=bikourar.42.fr"

EXPOSE 443/tcp

ENTRYPOINT ["/nginx_sh"]

