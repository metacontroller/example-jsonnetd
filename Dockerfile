FROM golang:1.15.7 AS build

COPY . /go/src/example-jsonnetd/
WORKDIR /go/src/example-jsonnetd/
RUN go mod vendor && go install

FROM debian:stretch-slim
COPY --from=build /go/bin/example-jsonnetd /example-jsonnetd/
WORKDIR /example-jsonnetd
ENTRYPOINT ["/example-jsonnetd/example-jsonnetd"]
EXPOSE 8080