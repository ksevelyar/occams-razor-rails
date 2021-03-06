# Occam's Razor - Rails 6 JSON API

## Features

* [fast_jsonapi](https://github.com/Netflix/fast_jsonapi) for ligtning fast JSON serialization (bless you, :tv: Netflix)
* [XSS/CSRF safe JWT auth](https://medium.com/@jcbaey/authentication-in-spa-reactjs-and-vuejs-the-right-way-e4a9ac5cd9a3) with `jwt_sessions`
* `redis` with `hiredis` driver for cache, JWT store and queues
* PostgreSQL
* Lightweight Docker images

## Development

* Rspec flavored TDD
* [shoulda-matchers](http://matchers.shoulda.io/)
* Factories bundled with [faker](https://github.com/stympy/faker)
* Static Analyzers: `rubocop-performance`, `rubocop-rails`, `rubocop-rspec`
* [asdf](https://github.com/asdf-vm/asdf)

## Setup with ASDF

```
bundle
bundle exec spring binstub --all
bin/rails db:setup
bin/rails s
```

## Setup with Docker Compose

```
docker-compose up
```

## Change config

```fish
env EDITOR=nvim bin/rails credentials:edit
```

## Generate token

```
bin/rails secret
```
