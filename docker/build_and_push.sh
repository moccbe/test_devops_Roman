#!/bin/bash
if [ -z "$1" ]; then
  echo "❌ Please provide a tag (e.g. ./build_and_push.sh v1)"
  exit 1
fi
TAG=$1
DOCKER_USERNAME="moccbe"
IMAGE_NAME="devops_test_ro"
FULL_TAG="${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"
cd "$(dirname "$0")/../docker"
echo "📦 Building Docker image: $FULL_TAG"
docker build -t "$FULL_TAG" .
docker push "$FULL_TAG"
