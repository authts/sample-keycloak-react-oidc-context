ARG KEYCLOAK_IMAGE=quay.io/keycloak/keycloak:24.0.2

FROM ${KEYCLOAK_IMAGE} as builder
ENV KC_DB=postgres
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM ${KEYCLOAK_IMAGE} as final
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
