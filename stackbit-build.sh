#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e42e9f84043d00012f6269d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e42e9f84043d00012f6269d
curl -s -X POST https://api.stackbit.com/project/5e42e9f84043d00012f6269d/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e42e9f84043d00012f6269d/webhook/build/publish > /dev/null
