FROM golang:1.21.5-bookworm AS builder
WORKDIR /app
COPY . .
RUN go build -o task-api


FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/task-api .
EXPOSE 8080
CMD ["./task-api"]