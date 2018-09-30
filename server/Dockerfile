FROM golang:alpine as builder

ENV GOPATH=/go

RUN apk update && apk add git alpine-sdk upx

RUN go get -u github.com/drone/drone-ui/dist
RUN go get -u golang.org/x/net/context
RUN go get -u golang.org/x/net/context/ctxhttp
RUN go get -u github.com/golang/protobuf/proto
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/drone/drone/cmd/drone-server
RUN go install -ldflags="-s -w" github.com/drone/drone/cmd/drone-server
RUN upx -9 /go/bin/drone-server


FROM alpine:latest
EXPOSE 8000 9000 80 443

ENV DATABASE_DRIVER=sqlite3
ENV DATABASE_CONFIG=/var/lib/drone/drone.sqlite
# ENV GODEBUG=netdns=go
# ENV XDG_CACHE_HOME=/var/lib/drone

COPY --from=builder /go/bin/drone-server /bin/drone-server
RUN mkdir -p /var/lib/drone/
ENTRYPOINT ["/bin/drone-server"]
