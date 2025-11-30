ARG UPSTREAM_IMAGE=ghcr.io/authelia/authelia:latest
FROM ${UPSTREAM_IMAGE}

COPY entrypoint.sh /app/custom-entrypoint.sh

RUN chmod +x /app/custom-entrypoint.sh

ENTRYPOINT ["/app/custom-entrypoint.sh"]
