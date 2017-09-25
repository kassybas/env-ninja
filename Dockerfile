FROM golang:latest
WORKDIR /app/
COPY . /app
RUN GOOS=linux go build -o env-ninja .

FROM alpine:latest
WORKDIR /app/
COPY --from=0 /app/env-ninja .
CMD ["/app/env-ninja"]

