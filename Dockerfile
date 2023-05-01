FROM eclipse-temurin:latest

LABEL version="2.2"
LABEL maintaner="Nathan Sutton"
LABEL release-date="2023-04-26"

RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install curl bzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --system --home /hl7 --disabled-password --group hl7
WORKDIR /hl7
USER hl7

RUN \
    curl -L https://sourceforge.net/projects/hl7api/files/hl7api-hl7overhttp/2.2/hapi-hl7overhttp-2.2-hapi-hl7overhttp-relay.tar.bz2/download -o hapi-hl7overhttp-relay.tar.bz2 && \
    tar -jxf hapi-hl7overhttp-relay.tar.bz2 

COPY config.xml /hl7/hl7overhttp-relay/config

WORKDIR /hl7/hl7overhttp-relay/bin

EXPOSE 8079

ENTRYPOINT ["./hl7overhttp-relay","console"]