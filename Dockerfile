FROM golang:1.13

ENV GO111MODULE=on
RUN go get github.com/volatiletech/sqlboiler@v3.5.0
RUN go get github.com/glerchundi/sqlboiler-crdb