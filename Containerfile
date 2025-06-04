# Base image. should run dotnet7 fine
FROM mcr.microsoft.com/dotnet/runtime:7.0

# Create directories
RUN mkdir /server
RUN mkdir /data

# Add the vintage story linux server binaries, version 1.20.11
ADD vs_server_linux-x64_1.20.11.tar.gz /server/
ADD init.sh /

# Default port is 42420
EXPOSE 42420
# /data contains server data
VOLUME [ "/data" ]

CMD [ "/bin/bash", "/init.sh" ]
