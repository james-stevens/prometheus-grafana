FROM alpine:3.22

RUN apk update
RUN apk upgrade

RUN rm -rf /tmp /run
RUN ln -s /dev/shm /tmp
RUN ln -s /dev/shm /run

RUN addgroup -g 850 -S prometheus
RUN adduser -u 850 -S -h /dev/null -G prometheus prometheus
RUN addgroup -g 851 -S grafana
RUN adduser -u 851 -S -h /dev/null -G grafana grafana

RUN apk add prometheus grafana
RUN ln -s /opt/data/grafana /usr/share/grafana/data

COPY bin /usr/local/bin
COPY inittab /etc/inittab

COPY build.txt /usr/local/etc/build.txt
CMD [ "/sbin/init" ]
