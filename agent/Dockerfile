FROM golang:alpine as builder

ENV GOPATH=/go

RUN apk update && apk add git alpine-sdk upx

RUN go get -u github.com/drone/drone-ui/dist
RUN go get -u golang.org/x/net/context
RUN go get -u golang.org/x/net/context/ctxhttp
RUN go get -u github.com/golang/protobuf/proto
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/drone/drone/cmd/drone-agent
RUN go install -ldflags="-s -w" github.com/drone/drone/cmd/drone-agent
RUN upx -9 /go/bin/drone-agent


FROM alpine:latest
EXPOSE 8000 9000 80 443

RUN apk update && apk upgrade && rm -fr /var/cache/apk/*

COPY --from=builder /go/bin/drone-agent /bin/drone-agent

ENTRYPOINT ["/bin/drone-agent"]
