# hl7overhttp-relay

This container relays an hl7 message from the MLLP protocol to a HAPI-compliant REST API.  The original program can be found [here](https://hapifhir.github.io/hapi-hl7v2/hapi-hl7overhttp/relay_intro.html).  

It is useful when many health systems don't have the resources to write their own transformations to a REST API.  It doesn't help the free version of Mirth only allow HTTP outbound channels, and not [HTTPS](https://forums.mirthproject.io/forum/mirth-connect/support/15422-https-sender).

I couldn't find the source control to reproduce [stodocker/hl7overhttp-relay](https://hub.docker.com/r/stodocker/hl7overhttp-relay), and so I reverse engineered it.  

You can reasonably integrate this relay with a REST API, for example [Microsoft's HL7 REST API](https://github.com/microsoft/health-architectures/tree/main/HL7Conversion/hl7ingest). 

```
docker run -itd -p 8079:8079 -e HL7OVERHTTPHEADERS=x-functions-key="ABCDEFG123456789==" -e HL7OVERHTTPDEST="hl7.yourcompany.com/api/ingest" nathanjamessutton/hl7overhttp-relay
```
