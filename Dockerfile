FROM ubuntu:latest

ENV NODE_VERSION "12"
ENV TZ=Europe/Paris
RUN apt-get update -y && apt-get install -y git cmake ninja-build libpng-dev zlib1g-dev libxml2-dev pkg-config
RUN git clone https://github.com/facebook/xcbuild && cd xcbuild && git submodule update --init && make -j 8 && cp -a build/. /usr/bin/

RUN apt-get update && \
    apt-get -y install curl gnupg && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
    apt-get -y install nodejs

RUN node -v && npm -v

RUN npm install -g @ionic/cli@6.4.0
