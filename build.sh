#!/usr/bin/env bash
IMAGE="cgp"
TAG="$IMAGE:$(date +"%Y%m%d-%H%M%S")"
if docker build --compress --no-cache --tag $TAG .; then
  #docker tag "$TAG" "$IMAGE:latest"
  echo -e "\nImage $TAG successfully created!\n"
  
  echo -e "\nTrying to authenticate and push latest image to Docker Hub ...\n"
  docker login && \
  docker tag "$TAG" "pedbarbosa/$TAG" && \
  docker tag "$TAG" "pedbarbosa/$IMAGE:latest" && \
  docker push "pedbarbosa/$TAG" && \
  docker push "pedbarbosa/$IMAGE:latest"
else
  echo -e "\nERROR: Image $TAG failed to create!"
fi
