#!/bin/sh
# Build the test package images locally (single-arch, loaded into the local docker).
#   ./build.sh                     -> spm-test-pkg:1.0.0, spm-test-pkg:1.1.0
#   IMAGE=ghcr.io/<owner>/spm-test-pkg ./build.sh
set -e
cd "$(dirname "$0")"
IMAGE="${IMAGE:-spm-test-pkg}"
for v in 1.0.0 1.1.0; do
  docker build -q --build-arg "MANIFEST=$(./spm-test-pkg/manifest.sh "$v")" \
    -t "$IMAGE:$v" spm-test-pkg
done
docker tag "$IMAGE:1.1.0" "$IMAGE:latest"
echo "built $IMAGE:1.0.0 $IMAGE:1.1.0 $IMAGE:latest"
