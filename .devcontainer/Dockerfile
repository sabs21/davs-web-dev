FROM httpd:latest
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
RUN apt-get update \
 && apt-get -y install rsync

EXPOSE 8080