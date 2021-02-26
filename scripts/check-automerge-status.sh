#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
PR_NUM=$2
curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM"
while true; do
    mergeable=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w mergeable | awk '{print $2}' | sed -e 's/,//g')
    if [ "$mergeable" != "null" ]; then
        merged=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w merged | awk '{print $2}' | sed -e 's/,//g')
        if [ "$merged" == false ]; then
            exit 1
        else
            break
        fi
    fi
done
