# Build Stage: use official Go image
FROM golang:1.22 AS build

WORKDIR /app

COPY . .

# Optional: disable CGO for static binary
ENV CGO_ENABLED=0

# Build Go app
RUN go build -o /app .

# Final Stage: minimal scratch image
FROM scratch

COPY --from=build /app /app

EXPOSE 8080
ENTRYPOINT ["/app"]

