# Build Stage
FROM golang:alpine AS build

WORKDIR /app

COPY . .

ENV CGO_ENABLED=0

RUN go build -o app

# Final Image
FROM scratch

COPY --from=build /app/app /app

EXPOSE 8080

ENTRYPOINT ["/app"]

