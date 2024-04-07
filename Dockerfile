# syntax=docker/dockerfile:1
FROM golang:1.21
WORKDIR /src
COPY . /src
RUN go build -o /bin/stress

FROM scratch
MAINTAINER vishnuk@google.com

COPY --from=0 /bin/stress /bin/stress

ENTRYPOINT ["stress", "-logtostderr"]
