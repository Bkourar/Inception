FROM debian:bookworm-slim

RUN apt-get -qq update -y && apt-get -q install --no-install-recommends mariadb-server -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/log/mysql && chown mysql:mysql /var/log/mysql && \
    mkdir -p /var/sql_data && chown mysql:mysql /var/sql_data

COPY --chmod=644 conf/my.cnf /etc/mysql/
COPY --chmod=644 conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY --chmod=744 tools/initial.sh /initial.sh
COPY --chmod=744 tools/set_updb.sh /set_updb.sh

EXPOSE 3306

ENTRYPOINT ["/initial.sh"]
