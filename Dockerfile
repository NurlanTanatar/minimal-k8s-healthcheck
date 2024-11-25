FROM golang:1.23-alpine3.19 AS builder
WORKDIR /app
COPY main.go main.go
RUN apk add --no-cache git
RUN go mod init healthcheck
RUN go mod tidy
# -ldflags="-w -s" для уменьшения размера бинарного файла
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
    -ldflags="-w -s"

FROM alpine:3.19
COPY --from=builder /app /app
EXPOSE 8080
ENTRYPOINT ["/app/healthcheck"]
