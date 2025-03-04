FROM openjdk:jre-alpine

ENV JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true"
ENV ZIPCODE_SERVICE_URL=""
ENV JAEGER_HOST=""

ADD target/*-thorntail.jar /opt/service.jar

EXPOSE 8080
ENTRYPOINT exec java -jar /opt/service.jar $JAVA_OPTS -Dthorntail.properties.zipcode-service.url=$ZIPCODE_SERVICE_URL -Dthorntail.jaeger.agent-host=$JAEGER_HOST