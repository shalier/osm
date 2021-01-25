#!/bin/bash
# shellcheck disable=SC1091

source .env

#     done
IMAGE_TAG=$1
# IMAGE_REPO=shalier

tokenUri="https://auth.docker.io/token?service=registry.docker.io&scope=repository:${CTR_REGISTRY}/$IMAGE_TAG:pull"
bearerToken="$(curl --silent --get $tokenUri | jq --raw-output '.token')"
listUri="https://registry-1.docker.io/v2/${CTR_REGISTRY}/$IMAGE_TAG/tags/list"
authz="Authorization: Bearer $bearerToken"
version_list="$(curl --silent --get -H "Accept: application/json" -H "$authz" $listUri | jq --raw-output '.')"
exists=$(echo $version_list | jq --arg t ${CTR_TAG} '.tags | index($t)')
echo $exists
if [[ $exists == null ]]
then
    make docker-push-$image_tag
fi