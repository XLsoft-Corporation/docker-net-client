FROM alpine:3.20
LABEL Author="@ytabuchi"

# Install curl and httpie
RUN apk update && \
    apk --no-cache add curl httpie

# Install MySQL and PostreSQL client
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US:
RUN apk --no-cache add mysql-client && \
    echo [client]'\n'default-character-set=utf8 >> /etc/my.cnf
RUN apk --no-cache add postgresql-client
RUN apk upgrade

RUN addgroup -g 1100 appusers && \
    adduser -D -h /home/appuser -s /bin/sh -u 1101 -g 1100 appuser

WORKDIR /home/appuser

USER appuser
