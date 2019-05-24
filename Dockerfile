FROM golang as binstage
COPY ./runforever.go /go/runforever.go
RUN \
 GOOS=linux GOARCH=amd64 \
 go build -ldflags="-w -s" -o /runforever
FROM scratch
COPY --from=binstage /runforever /runforever
ENTRYPOINT ["/runforever"]
