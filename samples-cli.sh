#!/bin/bash

### build ###
function build-app() {
  echo ""
  echo "===================="
  echo "Building application"
  echo "===================="
  echo ""
  mvn clean install -DskipTests && cp -f target/samples.war ./openliberty-dropins/
}
function build-images() {
    echo ""
    echo "========================="
    echo "Building Container images"
    echo "========================="
    echo ""
  docker-compose -f docker-compose.yaml build --no-cache
}
### compose ###
function run-compose() {
  echo ""
  echo "==================="
  echo "Running application"
  echo "==================="
  echo ""
  docker-compose -f docker-compose.yaml up -d
}

function stop-compose() {
  echo ""
  echo "===================="
  echo "Stopping application"
  echo "===================="
  echo ""
  docker-compose -f docker-compose.yaml down --remove-orphans
}
### kubernetes ###
### script ###

COMMAND="${1:-help}"

# Build app
if [ "$COMMAND" = "build-app" ]; then
  build-app
fi

# Build docker images
if [ "$COMMAND" = "build-images" ]; then
  build-images
fi

# run on docker compose
if [ "$COMMAND" = "up" ]; then
  IMAGE_PRESENT=$(docker image ls | grep com.example/samples)
  IMAGE_PRESENT=$?
  if [ "$IMAGE_PRESENT" = "1" ]; then
    echo ""
    echo "======================================================="
    echo "Container mages are missing, Trying to build them first"
    echo "======================================================="
    echo ""
    build-images
  fi
  build-app
  run-compose
fi

#stop docker compose
if [ "$COMMAND" = "down" ]; then
  stop-compose
fi

# help
if [ "$COMMAND" = "help" ]; then
  echo ""
  echo "Usage:"
  echo "  samples-cli.sh <command>"
  echo "Commands:"
  echo "  build-app    : build app and copy war into deployment dir"
  echo "  build-images : build docker images"
  echo "  up           : run on docker-compose"
  echo "  down         : stop running on docker-compose"
  echo ""
fi
