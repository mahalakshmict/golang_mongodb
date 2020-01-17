#! /bin/sh

export GOPATH=/root/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
go get github.com/globalsign/mgo
go build /root/go/service.go
./service
