ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    curl \
    bash \
    sqlite \
    jq \
    tzdata

WORKDIR /opt
RUN git clone --recurse-submodules --depth=1 https://github.com/Yeraze/meshmonitor.git meshmonitor

WORKDIR /opt/meshmonitor
RUN npm install --legacy-peer-deps
RUN npm run build
RUN npm run build:server

RUN mkdir -p /data/meshmonitor

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 3001
VOLUME ["/data/meshmonitor"]

CMD [ "/run.sh" ]
