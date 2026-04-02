FROM ruby:3.2.3

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  git \
  libsqlite3-dev \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock* ./
RUN bundle install

COPY . .

RUN bundle exec rails assets:precompile || true

EXPOSE 3000

CMD ["bash", "-lc", "bundle exec rails db:prepare && bundle exec rails server -b 0.0.0.0 -p 3000"]
