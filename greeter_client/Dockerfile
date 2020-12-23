FROM golang:1.15-alpine as builder

ENV BASE_APP_DIR=/go/src/github.com/aerfio/grpc-fun
ENV GOOS=linux GOARCH=amd64 CGO_ENABLED=0
WORKDIR ${BASE_APP_DIR}

COPY ./go.mod .
COPY ./go.sum .

RUN go mod download

COPY ./greeter_client ${BASE_APP_DIR}/greeter_client
COPY ./helloworld ${BASE_APP_DIR}/helloworld

RUN go build -ldflags "-s -w" -a -o main ./greeter_client/main.go \
    && mkdir /app \
    && mv ./main /app/main

FROM alpine:3.12.3
RUN apk --update add ca-certificates

COPY --from=builder /app /app

ENTRYPOINT ["/app/main"]
