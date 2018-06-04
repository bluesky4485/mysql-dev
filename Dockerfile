FROM alpine:3.7
MAINTAINER kolehank kolehank@gmail.com

# 软件包安装
RUN apk update && apk add mysql mysql-client

# 软件包参数配置/Users/rooy/devtools/jboot-docker/mysql/build.sh

RUN mkdir /run/mysqld/ && mkdir -p /apps/mysql/
COPY my.cnf /etc/mysql/my.cnf
RUN chmod 644 /etc/mysql/my.cnf
COPY init_mysql.sh /apps/
RUN chmod +x /apps/init_mysql.sh
COPY import.sql /apps/


WORKDIR /apps/

# 端口号配置
EXPOSE 3306
VOLUME ["/apps/mysql"]

# 容器命令执行
CMD ["/apps/init_mysql.sh"]
