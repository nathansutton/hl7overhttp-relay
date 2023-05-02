FROM eclipse-temurin:latest

LABEL version="2.2"
LABEL maintaner="Nathan Sutton"
LABEL release-date="2023-04-26"

RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --system --home /hl7 --disabled-password --group hl7
WORKDIR /hl7
USER hl7

# extracted manuall from stodocker/hl7overhttp-relay
# unknown ATM why the source distribution doesn't work
COPY hl7overhttp-relay.tar.gz /hl7

RUN \
    tar -xzvf hl7overhttp-relay.tar.gz 

WORKDIR /hl7/hl7overhttp-relay/bin

EXPOSE 8079

ENTRYPOINT ["./hl7overhttp-relay","console"]