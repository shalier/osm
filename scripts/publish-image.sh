#!/bin/bash
# shellcheck disable=SC1091

IMAGE_TAG=$1

if [ -z ${CTR_TAG} ]
then
    echo "Error CTR_TAG is empty"
    exit 1
elif [ -z ${CTR_REGISTRY} ]
then
    echo "Error CTR_REGISTRY is empty"
    exit 1
fi


tokenUri="https://auth.docker.io/token?service=registry.docker.io&scope=repository:${CTR_REGISTRY}/$IMAGE_TAG:pull"
bearerToken="$(curl --silent --get $tokenUri | jq --raw-output '.token')"
listUri="https://registry-1.docker.io/v2/${CTR_REGISTRY}/$IMAGE_TAG/tags/list"
authz="Authorization: Bearer $bearerToken"
version_list="$(curl --silent --get -H "Accept: application/json" -H "$authz" $listUri | jq --raw-output '.')"
exists=$(echo $version_list | jq --arg t ${CTR_TAG} '.tags | index($t)')
echo $version_list
# error_code=$(echo $version_list | jq '.errors[].code')
# echo $error_code
echo $tokenUri
# if [ ! -z $error_code ] && [ $error_code=="UNAUTHORIZED" ]
# then
#     echo "Error: Please check CTR_REGISTRY"
#     exit 1
# fi

if [[ $exists == null ]]
then
    make docker-push-$IMAGE_TAG
    # make docker-build-$IMAGE_TAG
    # docker push "${CTR_REGISTRY}/$IMAGE_TAG:${CTR_TAG}" || { echo "Error pushing images to container registry ${CTR_REGISTRY}/$IMAGE_TAG:${CTR_TAG}"; exit 1; };
fi