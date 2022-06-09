FROM ruby:3.1.2-alpine

ARG USER
ARG UID

ARG PACKAGES="g++ make git postgresql-dev bash tzdata less"
ARG RAILS_ROOT="/usr/src/app"

ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

RUN apk update && apk add --no-cache $PACKAGES
RUN mkdir -p  "$RAILS_ROOT"
RUN adduser --gecos "$USER" --uid "$UID" --disabled-password "$USER"

USER "$USER"

WORKDIR "$RAILS_ROOT"

RUN rm -rf tmp/cache app/assets vendor/assets /tmp/**/*

CMD ["bundle", "exec", "rails", "s"]
