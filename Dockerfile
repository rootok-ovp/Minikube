FROM golang:1-alpine as build
WORKDIR /app
COPY server.go /app
RUN go build server.go
FROM alpine:latest
WORKDIR /app
COPY --from=build /app /app
EXPOSE 8080
ENTRYPOINT ["./hello"]
