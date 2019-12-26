#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e04d2ba269d3a001a95116e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e04d2ba269d3a001a95116e
curl -s -X POST https://api.stackbit.com/project/5e04d2ba269d3a001a95116e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e04d2ba269d3a001a95116e/webhook/build/publish > /dev/null
