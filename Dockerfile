FROM maven:3.5.2-jdk-8

RUN mkdir -p /app

COPY . /app

WORKDIR /app

EXPOSE 8008

CMD mvn spring-boot:run 
