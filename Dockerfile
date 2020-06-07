
FROM node:alpine
ARG USER_ID=1000
WORKDIR "/app"

RUN apk update && apk add  \
    ca-certificates \
    dumb-init \
    git \
    python \
    procps \
    rsync \
    curl \
    zip \
    openssh-client \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG VERSION=latest
LABEL angular-cli=$VERSION node=$NODE_VERSION

RUN set -xe \
    && mkdir -p /tmp \
    && chown $USER_ID /tmp \
    && chmod a+rw /tmp \
    && mkdir -p /app \
    && chown $USER_ID /app \
    && chown -R node /usr/local/lib /usr/local/include /usr/local/share /usr/local/bin \
    && (cd /tmp; su node -c "npm install -g @angular/cli@$VERSION; npm install -g yarn; chmod +x /usr/local/bin/yarn; npm cache clean --force")

USER $USER_ID
EXPOSE 4200

ENTRYPOINT ["/usr/bin/dumb-init", "--"]