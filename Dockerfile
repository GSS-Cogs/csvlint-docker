FROM ruby:2.4.3-alpine

COPY Gemfile /usr/src/csvlint/

RUN \
  apk --no-cache -t .dev add build-base git && \
  cd /usr/src/csvlint && \
  bundle && \
  bundle install && \
  apk del .dev && \
  apk --no-cache add libcurl

VOLUME /workspace
WORKDIR /workspace