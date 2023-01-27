FROM maven:3.5.2-jdk-8

RUN mkdir -p /app

COPY . /app

WORKDIR /app

EXPOSE 8012

CMD ["mvn spring-boot:run","runserver","0.0.0.0:8012"]
