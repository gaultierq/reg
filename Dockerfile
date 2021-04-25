# Dockerfile - Development environment
FROM ruby:2.7.2
MAINTAINER delir@canonic.fr

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

RUN apt-get update -qq && apt-get install -y build-essential
# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
#RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

ENV APP_HOME /usr/src/app/


# 2: We'll set the application path as the working directory
WORKDIR $APP_HOME

# 3: We'll add the app's binaries path to $PATH:
ENV HOME=/usr/src/app PATH=/usr/src/app/bin:$PATH

# 4: Install node as a javascript runtime for asset compilation. Blatantly
# ripped off from the official Node Docker image's Dockerfile. GPG keys
# listed at https://github.com/nodejs/node

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# For bundle caching
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle


# 5: Install the current project gems - they can be safely changed later
# during development via `bundle install` or `bundle update`:
ADD Gemfile* $APP_HOME
RUN set -ex && bundle install
