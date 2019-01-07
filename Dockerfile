FROM ubuntu:12.04
MAINTAINER Patrycja Al-Shureideh

EXPOSE 80 8080

RUN apt-get update -y --fix-missing && apt-get install -y \
	python-software-properties \
	software-properties-common \
	git \
	maven \
	apache2
RUN add-apt-repository ppa:openjdk-r/ppa -y
RUN apt-get update -y && apt-get install openjdk-8-jdk -y
RUN apt-get autoremove -y
CMD ["mkdir -p /app"]
WORKDIR /app
RUN git clone https://github.com/haroonzone/hello-dropwizard.git
CMD ["a2enmod proxy ; a2enmod proxy_http ; a2enmod proxy_balancer ; a2enmod proxy_balancer ; service apache2 restart"]
RUN git clone https://github.com/patrycjadziubek/vagrantxdocker.git
CMD ["cp /app/vagrantxdocker/default /etc/apache2/sites-available/ ; service apache2 reload"]
WORKDIR /app/hello-dropwizard
CMD ["mvn package"]
CMD ["java -jar target/hello-dropwizard-1.0-SNAPSHOT.jar server example.yaml >/dev/null 2>&1 &"]
