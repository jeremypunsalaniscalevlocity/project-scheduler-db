FROM mysql:latest as builder

# needed for intialization
ENV MYSQL_DATABASE=projectscheduler \
    MYSQL_ROOT_PASSWORD=root

ADD setup.sql /docker-entrypoint-initdb.d

# That file does the DB initialization but also runs mysql daemon, by removing the last line it will only init
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]
RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--datadir", "/initialized-db"]

FROM mysql:latest

COPY --from=builder /initialized-db /var/lib/mysql

EXPOSE 3306