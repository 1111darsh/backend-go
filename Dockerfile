FROM golang:1.21.5-alpine3.19 AS builder
WORKDIR /app
COPY . .
RUN go build -o task-api


FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/task-api .
RUN chmod +x task-api
CMD ["./task-api"]
EXPOSE 5002