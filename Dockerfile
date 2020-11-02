FROM golang:1.15.3
ARG SQLBOILER_VERSION
ENV GO111MODULE=on
RUN go get github.com/volatiletech/sqlboiler/v4@v$SQLBOILER_VERSION
RUN go get github.com/glerchundi/sqlboiler-crdb/v4