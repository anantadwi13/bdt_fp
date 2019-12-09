FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Setting timezone
RUN echo "tzdata tzdata/Areas select Asia" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/Asia select Jakarta" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt update && \
    apt upgrade -y && \
    apt install -y tzdata && \
    apt update

# Installing dependencies
RUN apt install -y htop nano curl
    
RUN curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | bash &&\
    apt -y install sysbench
