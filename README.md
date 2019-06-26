# Occam's Razor - Rails 6 JSON API
![API](https://i.imgur.com/gxw5dxr.png)

## Features

* `fast_json` for ligtning fast JSON serialization
* `jwt_sessions` for authentication
* `redis` with `hiredis` driver for cache, JWT store and queues

## Development

* Rspec flavored TDD
* [shoulda-matchers](http://matchers.shoulda.io/)
* Factories bundled with Faker
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

```
bin/rails credentials:edit
```

## Generate token

```fish
env EDITOR=nvim bin/rails credentials:edit
```
