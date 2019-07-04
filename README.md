# Occam's Razor - Rails 6 JSON API

## Features

* [fast_jsonapi](https://github.com/Netflix/fast_jsonapi) for ligtning fast JSON serialization (bless you, :tv: Netflix)
* [XSS/CSRF safe JWT auth](https://medium.com/p/e4a9ac5cd9a3/responses/show) with `jwt_sessions`
* `redis` with `hiredis` driver for cache, JWT store and queues
* PostgreSQL

## Development

* Rspec flavored TDD
* [shoulda-matchers](http://matchers.shoulda.io/)
* Factories bundled with [faker](https://github.com/stympy/faker)
* Static Analyzers: `rubocop-performance`, `rubocop-rails`, `rubocop-rspec`
* [asdf](https://github.com/asdf-vm/asdf)

## Setup

```
bundle
bundle exec spring binstub --all
bin/rails db:setup
bin/rails s
```

## Change config

```fish
env EDITOR=nvim bin/rails credentials:edit
```

## Generate token

```
bin/rails secret
```
