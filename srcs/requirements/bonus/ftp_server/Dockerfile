FROM debian:bookworm
RUN apt-get update -y  && apt-get install -y vsftpd passwd


COPY --chmod=644 conf/vsftpd_conf /etc/vsftpd.conf
COPY --chmod=744 tools/start_sh /_start.sh


RUN mkdir -p /etc/vsftpd && touch /etc/vsftpd/user_list && chmod 644 /etc/vsftpd/user_list

# RUN useradd -m -s /bin/bash myftpuser && \
#     echo "myftpuser:password" | chpasswd


CMD ["/_start.sh"]
