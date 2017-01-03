#!/usr/bin/env bash

if [ -z "${MASTER_URL}" ]; then
    echo "Environment variable MASTER_URL not provided, export to localhost by default" 1>&2
fi

if [ -z "${MASTER_PORT}" ]; then
    echo "Environment variable MASTER_PORT not provided, export to 8080 by default" 1>&2
fi

if [ -z "${SLAVE_NAME}" ]; then
    echo "Environment variable SLAVE_NAME not provided, export to slave01 by default" 1>&2
fi

curl -L http://${MASTER_URL}:${MASTER_PORT}/jnlpJars/slave.jar -o /tmp/slave.jar || exit 1

java $JAVA_OPTS -jar /tmp/slave.jar -jnlpUrl http://${MASTER_URL:-localhost}:${MASTER_PORT:-8080}/computer/${SLAVE_NAME:slave01}/slave-agent.jnlp
