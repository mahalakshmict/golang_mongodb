FROM golang:1.7.3 AS builder
WORKDIR /root/
RUN go get -d -v github.com/globalsign/mgo
COPY service.go /root/.
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM mongo:latest
WORKDIR /root/
COPY --from=builder /root/app .
RUN echo -e "#! /bin/sh \nmongod 2>&1 & \n./app" > run.sh
RUN chmod +x run.sh
CMD ./run.sh

