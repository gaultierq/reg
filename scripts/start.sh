#!/bin/bash

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="$(dirname "$HERE")"


echo "\
cd $PROJ_ROOT && ./bin/rails server
cd $PROJ_ROOT && bundle exec sidekiq 2>&1 | logger -t sidekiq" | $HERE/__multi
