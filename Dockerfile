FROM node:12-alpine
MAINTAINER Ralph Meier <ralphmeier79@gmail.com>

RUN apk --no-cache add curl
RUN npm install -g artillery@1.6.0-29 --allow-root --unsafe-perm=true

VOLUME /artillery
WORKDIR /artillery

COPY artillery-web.yml entrypoint.sh /artillery/
ENTRYPOINT ["/artillery/entrypoint.sh"]