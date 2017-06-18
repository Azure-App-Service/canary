#!/usr/bin/env bash
set -x -e

docker build -t "$1"/canary:1.0 1.0

docker login -u "$2" -p "$3"

docker push "$1"/canary:1.0

docker logout