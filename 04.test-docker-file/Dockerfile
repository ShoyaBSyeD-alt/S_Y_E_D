FROM fedora:latest

RUN dnf -y update && \
    dnf -y install golang git && \
    dnf clean all

WORKDIR /app

COPY . .

ENV CGO_ENABLED=0

RUN go build -o /app .

EXPOSE 8080
ENTRYPOINT ["/app"]

