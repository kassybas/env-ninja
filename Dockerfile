FROM golang:latest
WORKDIR /app/
COPY . /app
RUN GOOS=linux go build -o env-ninja .

FROM scratch
COPY --from=0 /app/env-ninja /app/
ENV PATH /app/:$PATH
WORKDIR /workdir/

ENTRYPOINT ["env-ninja"]

