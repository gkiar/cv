FROM ubuntu:17.04
MAINTAINER Greg Kiar <greg.kiar@mcgill.ca>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy texlive-full biber=2.7-2 make git vim && \
    rm -rf /var/lib/apt/lists/*

COPY build.sh /build.sh
RUN chmod +x /build.sh

ENTRYPOINT [ "/build.sh" ]
