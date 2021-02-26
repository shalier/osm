#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
PR_NUM=$2

while true; do
    merged=$(curl -s -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w merged | awk '{print $2}' | sed -e 's/,//g')
    if [ "$merged" == false ]; then
        while [ -z "$rebaseable" ] || [ "$rebaseable" == "null" ]; do
            rebaseable=$(curl -s -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w rebaseable | awk '{print $2}' | sed -e 's/,//g')

            if [ "$rebaseable" == "true" ]; then
                break
            else
                exit 1
            fi
            sleep 30
        done
    elif [ "$merged" == true ]; then
        break
    fi
    sleep 30
done
