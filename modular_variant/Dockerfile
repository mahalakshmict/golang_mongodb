FROM debian:9

RUN echo "root:golang1" | chpasswd

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-utils wget git ca-certificates

RUN wget --no-check-certificate https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz

RUN mkdir /root/go
COPY service.go /root/go/.
COPY run.sh /root/.

ENTRYPOINT ["/root/run.sh"]
