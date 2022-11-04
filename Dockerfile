FROM hendrikmaus/nomad-cli:1.2.3

RUN apk update && apk add bash gettext jq curl ca-certificates

WORKDIR /app
COPY deploy /app/deploy

ENTRYPOINT ["/app/deploy"]
