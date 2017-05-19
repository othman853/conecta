FROM ruby:2.3.1
RUN mkdir -p /usr/app
WORKDIR /usr/app
RUN apt-get -qq update
RUN apt-get -qq -y install libpq-dev postgresql-server-dev-9.4
COPY Gemfile /usr/app
COPY Gemfile.lock /usr/app
RUN bundle install
