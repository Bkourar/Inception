FROM debian:bookworm-slim

RUN apt-get -qq update -y && apt-get -q install --no-install-recommends -y vsftpd passwd && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/vsftpd && touch /etc/vsftpd/user_list && \
    chmod 644 /etc/vsftpd/user_list

COPY --chmod=644 conf/vsftpd_conf /etc/vsftpd.conf
COPY --chmod=744 tools/start_sh /_start.sh


CMD ["/_start.sh"]
