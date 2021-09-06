FROM httpd
LABEL maintainer="Tia M"
RUN apt -y update && \
    apt -y install wget && \
    apt -y install unzip

WORKDIR /usr/local/apache2/htdocs/

RUN rm -rf * && \
    wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/static-website-example.zip && \
    unzip static-website-example.zip && \
    cp -R static-website-example/* . && \
    rm -rf static-website-example.zip && \
    rm -rf static-website-example

USER root
ENTRYPOINT ["httpd-foreground"]
EXPOSE 80
