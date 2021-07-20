FROM php:7-apache
MAINTAINER Pedro Barbosa, https://github.com/pedbarbosa

RUN apt update && apt upgrade -y && apt install -y git rrdtool && \
    apt clean autoclean && \
    apt autoremove -y && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/info/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/lib/{apt,cache,dpkg,log}/
RUN docker-php-ext-install json

RUN a2enmod rewrite
RUN rm -rf /var/www/html
WORKDIR /usr/src
RUN git clone https://github.com/pommi/CGP.git && \
    cd CGP && \
    rm -rf .git && \
    ln -s /usr/src/CGP /var/www/html
WORKDIR /
COPY config.local.php /usr/src/CGP/conf/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
