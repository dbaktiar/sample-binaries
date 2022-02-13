#!/bin/bash -ex

JMX_REGISTRY_PORT=11099
VERSION=0.0.2
JAVA_AGENT="-javaagent:/opt/apps/newrelic/newrelic.jar"
LOG_CONFIG="-Dlogging.config=/opt/apps/conf/logback.xml"

java ${JAVA_AGENT} \
        ${LOG_CONFIG} \
        -Dcom.sun.management.jmxremote.port=${JMX_REGISTRY_PORT} \
        -Dcom.sun.management.jmxremote.ssl=false \
        -Dcom.sun.management.jmxremote.authenticate=false \
        -Dcom.sun.management.jmxremote.host=127.0.0.1 \
        -jar onlinebookstore-${VERSION}.jar
