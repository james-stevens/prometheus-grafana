FROM alpine:3.22

RUN apk update
RUN apk upgrade

RUN rmdir /tmp
RUN ln -s /dev/shm /tmp
RUN ln -s /dev/shm /ram

RUN apk add prometheus grafana



COPY build.txt /usr/local/etc/build.txt
CMD [ "/sbin/init" ]
