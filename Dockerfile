FROM golang:1.13
ARG SQLBOILER_VERSION
ENV GO111MODULE=on
RUN go get github.com/volatiletech/sqlboiler@v$SQLBOILER_VERSION
RUN go get github.com/glerchundi/sqlboiler-crdb