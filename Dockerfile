FROM golang

COPY . /go/src/github.com/danielcb/hound
ONBUILD COPY config.json /hound/
RUN go-wrapper install github.com/danielcb/hound/cmds/houndd

EXPOSE 6080

ENTRYPOINT ["/go/bin/houndd", "-conf", "/hound/config.json"]
