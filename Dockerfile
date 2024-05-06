FROM quay.io/keycloak/keycloak:24.0.3

COPY key.pem /opt/keycloak/ssl/key.pem
COPY cert.pem /opt/keycloak/ssl/cert.pem

ENV KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=admin \
    KC_PROXY=edge \
    KC_DB=postgres \
    KC_DB_URL=jdbc:postgresql://kc-db.c5u2ay66e1qg.eu-north-1.rds.amazonaws.com:5432/postgres \
    KC_DB_USERNAME=postgres \
    KC_DB_PASSWORD=postgres \
    KC_HOSTNAME_ADMIN_URL=http://localhost:9090 \
    KC_HOSTNAME_URL=http://localhost:9090 \
    JAVA_OPTS="-Xms512m -Xmx2048m -Djavax.net.ssl.keyStore=/opt/keycloak/ssl/tls.p12 -Djavax.net.ssl.keyStorePassword=password"

EXPOSE 8080

CMD ["start", "--optimized"]
