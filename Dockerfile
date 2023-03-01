FROM golang:1.20 AS builder
WORKDIR /go/src
RUN go mod init example/hello
COPY . .
RUN go build

FROM scratch
COPY --from=builder /go/src/hello .
CMD ["./hello"]