FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install --no-install-recommends -y nginx && \
    apt-get clean && \
    mkdir -p /var/lib/html && \
    adduser --system --no-create-home --disabled-login --group nginx && \
    chown -R nginx:nginx /var/lib/html && \
    chmod 755 /var/lib/html && \
    rm -rf /var/lib/apt/lists/*

COPY --chmod=644 conf/nginx.conf /etc/nginx/nginx.conf
COPY --chmod=644 --chown=nginx:nginx ./about/ /var/lib/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

