#!/bin/bash

set -x

# Default value if var does not exist.
NAME=${NAME:-"test"}
DOCKER_USER=${DOCKER_USER:-"abc"}
FOLDER=${FOLDER:-"."}
[ "$FOLDER" == "." ] && TAG=latest
[ "$FOLDER" != "." ] && TAG=${TAG:-"$FOLDER"}

DOCKERFILE=${DOCKERFILE:-"$FOLDER/Dockerfile"}

# Building    
docker build -t "$DOCKER_USER/$NAME:$TAG" -f "$DOCKERFILE" "$FOLDER"


# Find all builded container
CONTAINER_VERSION="$(docker image ls "$DOCKER_USER/$NAME" --format "{{.Tag}}")"


# Push hub.docker.com
if [[ -n "$DOCKER_PASS" ]] && [[ -n "$DOCKER_USER" ]]
then
    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
    for V in $CONTAINER_VERSION
    do
        docker push "$DOCKER_USER/$NAME:$V"
    done
fi


# Push github repo
if [[ -n "$GITHUB_PASS" ]] && [[ -n "$GITHUB_USER" ]]
then
    echo "$GITHUB_PASS" | docker login docker.pkg.github.com -u "$GITHUB_USER" --password-stdin
    for V in $CONTAINER_VERSION
    do
        docker tag "$DOCKER_USER/$NAME:$V" "docker.pkg.github.com/${REPO}/$NAME:$V"
        docker push "docker.pkg.github.com/${REPO}/$NAME:$V"
    done
fi
