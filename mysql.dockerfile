FROM mysql:5.7
COPY ./exam.sql /docker-entrypoint-initdb.d
ENV MYSQL_ROOT_PASSWORD=root
EXPOSE 3306