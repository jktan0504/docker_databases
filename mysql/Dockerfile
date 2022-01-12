FROM mysql:latest

LABEL version="0.1" description="MYSQL in docker" by="jktan0504@hotmail.com"

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

ADD /db/company.sql /etc/mysql/company.sql
# RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/data.sql -- better solution
RUN sed -i '1s/^/CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\nUSE $MYSQL_DATABASE;\n/' /etc/mysql/company.sql
# RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d -- not working
ADD /db/company.sql /docker-entrypoint-initdb.d

EXPOSE 3306