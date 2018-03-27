#!/bin/sh

for version in "17" "18"; do
  template="Dockerfile-dind.template"
  df="$version/Dockerfile"
  sed -r \
    -e 's!%%VERSION%%!'"$version"'!g' \
    "$template" > "$df"
  cp dockerd-entrypoint2.sh $version/
done