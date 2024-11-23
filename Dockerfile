FROM ruby:3.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /luiza-labs-challenge

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
