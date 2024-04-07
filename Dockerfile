# syntax=docker/dockerfile:1
FROM golang:1.19 as build
ARG TARGETARCH
WORKDIR /src
COPY . /src
RUN GOOS=linux GOARCH=$TARGETARCH go build -o /src/stress

FROM debian
MAINTAINER vishnuk@google.com

COPY --from=build /src/stress /usr/bin/stress

ENTRYPOINT ["stress", "-logtostderr"]
