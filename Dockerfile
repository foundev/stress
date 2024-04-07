# syntax=docker/dockerfile:1
FROM golang:1.19
WORKDIR /src
COPY . /src
RUN go build -o ./stress

FROM scratch
MAINTAINER vishnuk@google.com

COPY --from=0 /src/stress ./stress

ENTRYPOINT ["./stress", "-logtostderr"]
