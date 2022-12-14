FROM icr.io/appcafe/open-liberty:22.0.0.9-full-java11-openj9-ubi

COPY --chown=1001:0 src/main/liberty/config /config
COPY --chown=1001:0 src/main/liberty/*.jar /opt/ol/wlp/usr/shared/resources/
#COPY --chown=1001:0 target/*.war /config/apps

EXPOSE 8080

RUN configure.sh
CMD ["/opt/ol/wlp/bin/server", "debug", "defaultServer"]
