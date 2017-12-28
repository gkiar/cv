FROM ubuntu:16.04
MAINTAINER Greg Kiar <greg.kiar@mcgill.ca>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy texlive-full biber python-pygments gnuplot make git && \
    rm -rf /var/lib/apt/lists/*

COPY build.sh /build.sh
RUN chmod +x /build.sh

ENTRYPOINT [ "/build.sh" ]
