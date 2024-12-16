FROM ubuntu:latest
RUN sudo apt-get -y update && sudo apt-get -y install nginx
COPY content/index.html /var/www/html/index.nginx-debian.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
