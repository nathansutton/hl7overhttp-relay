# hl7overhttp-relay

This container relays an hl7 message from the MLLP protocol to a HAPI-compliant REST API.  The original program can be found [here](https://hapifhir.github.io/hapi-hl7v2/hapi-hl7overhttp/relay_intro.html).  

It is useful when many health systems don't have the resources to write their own transformations to a REST API.  It doesn't help the free version of Mirth only allow HTTP outbound channels, and not [HTTPS](https://forums.mirthproject.io/forum/mirth-connect/support/15422-https-sender).

I couldn't find the source control to reproduce [stodocker/hl7overhttp-relay](https://hub.docker.com/r/stodocker/hl7overhttp-relay), and so I reverse engineered it.  