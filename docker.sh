#!/bin/sh
set -e

rm -f tmp/pids/server.pid

bin/rails db:migrate 2>/dev/null || bin/rails db:setup

exec "$@"
