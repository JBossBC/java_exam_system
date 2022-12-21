FROM mysql:5.7
COPY ./exam.sql /docker-entrypoint-initdb.d
RUN mkdir "/opt/examdata"
ENV MYSQL_ROOT_PASSWORD=root
VOLUME /opt/examdata:/var/lib/mysql
EXPOSE 3306