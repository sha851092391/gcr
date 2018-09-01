#!/usr/bin/env bash

set -e

wget https://github.com/mritd/gcrsync/releases/download/v1.0.0/gcrsync_linux_amd64 -O gcrsync
chmod +x gcrsync
./gcrsync --debug --user ${DOCKER_USER} --password ${DOCKER_PASSWORD}

rm -f gcrsync

git add .
git commit -m "Travis CI Auto Synchronized."
git push --force https://$GITHUB_TOKEN@github.com/mritd/gcr.git master
