# Stage Build
FROM ruby:2.6.3-alpine as Build

ARG FOLDERS_TO_REMOVE
ARG BUNDLE_WITHOUT
ARG RAILS_ENV

ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}
ENV RAILS_ENV ${RAILS_ENV}
ENV SECRET_KEY_BASE=foo

RUN apk add --update --no-cache \
    build-base \
    cmake \
    postgresql-dev \
    git \
    imagemagick \
    tzdata

RUN gem install bundler

WORKDIR /rails

ADD Gemfile* /rails/
RUN bundle config --global frozen 1 \
 && bundle install --jobs $(nproc - 1) --retry 3 \
 # Remove unneeded files (cached *.gem, *.o, *.c)
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

ADD . /rails

# Remove folders not needed in resulting image
RUN rm -rf $FOLDERS_TO_REMOVE

# Stage Final
FROM ruby:2.6.3-alpine
LABEL maintainer="github.com/ksevelyar"

ARG ADDITIONAL_PACKAGES

RUN apk add --update --no-cache \
    postgresql-client \
    imagemagick \
    $ADDITIONAL_PACKAGES \
    tzdata \
    file && \
    addgroup -g 1000 -S rails && \
    adduser -u 1000 -S rails -G rails

USER rails

WORKDIR /rails
COPY --from=Build /usr/local/bundle/ /usr/local/bundle/
COPY --from=Build --chown=rails:rails /rails /rails

ENV RAILS_LOG_TO_STDOUT true

EXPOSE 3000

ENTRYPOINT ["./docker.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
