# Occam's Razor - Rails 6 JSON API
![API](https://i.imgur.com/gxw5dxr.png)

## Features

* `fast_json` for ligtning fast JSON serialization
* `jwt_sessions` for authentication
* `redis` with `hiredis` driver for cache, JWT store and queues

## Development

* Rspec flavored TDD
* Factories bundled with Faker
* Static Analyzers
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

```
bin/rails secret
```
