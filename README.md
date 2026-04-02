# Foundry Social

## Run with Docker

```bash
docker compose up --build
```

In another terminal:

```bash
docker compose exec web bundle exec rails db:setup
```

App:

- http://localhost:3000
- Seed user: `admin@test.com` / `123456`

## Local setup

```bash
bundle install
bin/rails db:setup
bin/rails server
```

## Test and quality checks

```bash
bundle exec rspec
bundle exec rubocop
bundle exec brakeman -q -w2
bundle exec bundle-audit check --update
```
