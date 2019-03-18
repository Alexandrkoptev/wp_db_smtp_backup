FROM wordpress:php7.1-apache
LABEL maintainer="alexandr.koptev@onix-systems.com"

RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp

RUN apt-get update \
    && apt-get install -y libldap2-dev gnutls-bin libapache2-mod-gnutls

RUN docker-php-ext-install ldap