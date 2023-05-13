# MULTISTAGE Build
FROM gradle:8.1.1-jdk17-alpine AS builder
WORKDIR /opt/java/
COPY . .
RUN gradle clean build

# MULTISTAGE Run
FROM websphere-liberty:23.0.0.4-kernel-java17-openj9

# Copy .jar file from build stage
COPY --from=builder /opt/java/build/libs/java.war /opt/ibm/wlp/usr/servers/defaultServer/apps/reviews.war
# Copy server configuration
COPY config/server.xml /opt/ibm/wlp/usr/servers/defaultServer/

RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense /opt/ibm/wlp/usr/servers/defaultServer/server.xml

EXPOSE 9080

CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]
