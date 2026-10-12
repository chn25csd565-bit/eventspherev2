#!/bin/sh
set -e

# If PORT is provided by Render or container host, reconfigure Tomcat connector
if [ -n "$PORT" ]; then
    echo "[EventSphere] Updating Tomcat connector port to $PORT..."
    sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml
else
    echo "[EventSphere] Using default port 8080..."
fi

echo "[EventSphere] Launching Apache Tomcat 10..."
exec /usr/local/tomcat/bin/catalina.sh run
