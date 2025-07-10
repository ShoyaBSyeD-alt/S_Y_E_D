FROM golang:alpine AS build

WORKDIR /app

# Copy the Go source code
COPY . .

# Set Go environment
ENV CGO_ENABLED=0

# Initialize go module (if not already in your repo)
RUN go mod init calculator && go mod tidy

# Build the Go app
RUN go build -o /app .

FROM scratch
COPY --from=build /app /app
EXPOSE 8080
ENTRYPOINT ["/app"]

