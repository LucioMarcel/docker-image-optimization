FROM golang:1.17 AS builder
WORKDIR /go/src
COPY . .
RUN apt-get update && apt-get install build-essential -y
RUN go build -o /go/bin/hello-fullcycle hello-fullcycle.go
CMD ["/go/bin/hello-fullcycle"]

FROM scratch
WORKDIR /go/bin
COPY --from=builder /go/bin .
CMD ["/go/bin/hello-fullcycle"]