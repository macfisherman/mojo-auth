FROM perl:5.30

RUN cpanm Carton \
    && mkdir -p /usr/src/app
RUN apt-get update
RUN apt install -y default-libmysqlclient-dev default-mysql-client default-mysql-client-core

EXPOSE 3000

WORKDIR /usr/src/app
