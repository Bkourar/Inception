FROM debian:bookworm
RUN apt -qq update -y && apt -qq upgrade -y && apt -q install passwd openssl vsftpd -y
###
COPY --chmod=444 conf/vsftpd_conf /etc/vsftpd.conf
COPY --chmod=744 tools/start_sh /_start.sh
###
CMD ["/_start.sh"]
