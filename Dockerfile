FROM httpd:latest
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
RUN apt-get update
WORKDIR /usr/local/apache2/htdocs
EXPOSE 8080
# Keep container running (for use in VSCode)
CMD [ "tail", "-f", "/dev/null" ]