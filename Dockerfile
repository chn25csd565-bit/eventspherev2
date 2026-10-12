# EventSphere Dockerfile for Render Cloud Deployment
# Jakarta Servlet 6.0 + JSP + Apache Tomcat 10 + JDK 17
FROM tomcat:10.1-jdk17-temurin

WORKDIR /usr/local/tomcat

# Remove default sample apps
RUN rm -rf webapps/*

# Copy web application JSP, WEB-INF, assets into ROOT context
COPY src/main/webapp/ webapps/ROOT/

# Copy SQL schemas and seed data to classpath and container app directory
COPY sql/ webapps/ROOT/WEB-INF/classes/sql/
COPY sql/ /app/sql/

# Copy Java source code for container build
COPY src/main/java/ /tmp/src/

# Compile all 41 Java source files
RUN mkdir -p webapps/ROOT/WEB-INF/classes && \
    find /tmp/src -name "*.java" > /tmp/sources.txt && \
    javac -encoding UTF-8 \
      -cp "lib/*:webapps/ROOT/WEB-INF/lib/*" \
      -d webapps/ROOT/WEB-INF/classes \
      @/tmp/sources.txt && \
    rm -rf /tmp/src /tmp/sources.txt

# Directory for autonomous embedded database
RUN mkdir -p /data/eventsphere_db && chmod -R 777 /data/eventsphere_db

# Copy and configure entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN sed -i 's/\r$//' /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

# Expose default HTTP port
EXPOSE 8080 10000

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
