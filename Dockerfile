FROM ubuntu:20.04
RUN apt-get update -y && apt-get install -y apache2 \
    && chown -R www-data:www-data /var/www/
ENV APACHE_RUN_USER www-data \
    APACHE_RUN_GROUP www-data \
    APACHE_LOG_DIR /var/log/apache2 \
    APACHE_LOCK_DIR /var/lock/apache2 \
    APACHE_PID_FILE /var/run/apache2.pid
COPY index.html /var/www/html/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

