FROM mysql:5.7
COPY schema.sql /docker-entrypoint-initdb.d
COPY java_exam_system.sql /docker-entrypoint-initdb.d
ENV MYSQL_ROOT_PASSWORD=root
EXPOSE 3306