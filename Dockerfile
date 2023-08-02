FROM jre17:latest
MAINTAINER Mahdi Sheikh Hosseini <mahsom@gmail.com>
COPY entrypoint.sh /
COPY V1034250-01.tar.gz /opt 
RUN tar -xvf /opt/V1034250-01.tar.gz -C /opt ; mv /opt/kv-21.2.63 /opt/oracle-nosql ; rm /opt/V1034250-01.tar.gz

COPY admin-cli /

expose 5000

CMD ["/entrypoint.sh"]
