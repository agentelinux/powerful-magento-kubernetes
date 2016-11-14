################################################################################
# Base image
################################################################################

FROM nginx

MAINTAINER "Krishna Pennacchioni" <krishna@agentelinux.com.br>

################################################################################
# Vars MAGENTO
################################################################################

ENV MAGENTO_VERSION "1.9.1.0"
ENV ADMIN_MAIL "krishna@agentelinux.com.br"


# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer
# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH
# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Setup the Composer installer
#RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
#  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
#  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"  


################################################################################
# Add HHVM repo
################################################################################

ENV HHVM_VERSION need-to-add-versioning

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list

################################################################################
# Install supervisor, HHVM & tools
################################################################################

RUN apt-get update && apt-get install -my \
	supervisor \
	hhvm \
	git \
	wget \
	curl \
	sendmail \
	sqlite3 \
	libsqlite3-dev \
    curl \
    && apt-get clean

################################################################################
# Install tools
################################################################################

RUN cd $HOME && \
    wget http://getcomposer.org/composer.phar && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer && \
    wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit  

RUN composer global require hirak/prestissimo 

################################################################################
# Configuration
##############################################################################

COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./config/php.ini /etc/hhvm/php.ini

COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./config/conf.d/config-1.conf /etc/nginx/conf.d/config-1.conf

COPY ./config/sites-enabled/default /etc/nginx/sites-enabled/default

COPY ./config/.bashrc /root/.bashrc


################################################################################
# Copy source
##############################################################################

COPY ./index.php /var/www/public/index.php

COPY ./src/Magento-CE-2.1.2_sample_data-2016-10-11-11-27-51.tar.gz /tmp/Magento-CE-2.1.2_sample_data-2016-10-11-11-27-51.tar.gz


RUN /var/www/magento
WORKDIR /var/www/magento

RUN tar zxvf  /tmp/Magento-CE-2.1.2_sample_data-2016-10-11-11-27-51.tar.gz

RUN chmod www-data:www-data -R /var/www/

################################################################################
# Boot
################################################################################

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]