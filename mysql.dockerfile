FROM mysql:5.7
COPY ./exam.sql /docker-entrypoint-initdb.d
RUN ["mkdir","/opt/mysqlConsistent"]
ENV MYSQL_ROOT_PASSWORD=root
VOLUME ./mysqlConsistent/:/var/lib/mysql/
EXPOSE 3306