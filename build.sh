#!/usr/bin/env bash
set -x -e

buildnumber=${4-$(date -u +"%y%m%d%H%M")}

docker build -t "$1"/canary:1.0_"$buildnumber" -t "$1"/canary:latest_"$buildnumber" 1.0

docker login -u "$2" -p "$3"

docker push "$1"/canary:1.0_"$buildnumber"
docker push "$1"/canary:latest_"$buildnumber"

docker logout
