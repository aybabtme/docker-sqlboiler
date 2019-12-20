#!/bin/bash

set -eu

sqlboiler_version=$(tr < sqlboiler_version -d '[:space:]')

HUB_USER=$(op get item Docker | jq -r '.details.fields[] | select(.designation=="username").value')
HUB_PWD=$(op get item Docker | jq -r '.details.fields[] | select(.designation=="password").value')

echo "Logging into Docker Hub"
echo $HUB_PWD | docker login -u $HUB_USER --password-stdin

echo "Building $sqlboiler_version image"
docker build --build-arg SQLBOILER_VERSION=$sqlboiler_version -t aybabtme/sqlboiler:$sqlboiler_version .
docker tag aybabtme/sqlboiler:$sqlboiler_version aybabtme/sqlboiler:latest

echo "Pushing image to Docker Hub"
docker push aybabtme/sqlboiler:$sqlboiler_version
docker push aybabtme/sqlboiler:latest
docker rmi aybabtme/sqlboiler:$sqlboiler_version
docker rmi aybabtme/sqlboiler:latest