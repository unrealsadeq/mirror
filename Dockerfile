FROM golang:1.19-alpine
WORKDIR $GOPATH/src/go.sadegh.io/mirror
COPY . .
RUN CGO_ENABLED=0 go install

FROM alpine:latest
COPY --from=0 /go/bin/mirror /bin/mirror
EXPOSE 8080
USER 2000:2000
CMD ["/bin/mirror"]
