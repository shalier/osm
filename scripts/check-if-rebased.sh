#!/bin/bash
# shellcheck disable=SC1091
# shellcheck disable=SC2086

GITHUB_REPOSITORY=$1
PR_NUM=$2
GITHUB_TOKEN=$3


for i in {1..5}
do
    rebaseable=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w rebaseable | awk '{print $2}' | sed -e 's/,//g')
    echo rebaseable "$rebaseable"
    if [ "$rebaseable" == "true" ]; then
        curl -X PATCH -H "Authorization Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" -d '{"state":"closed"}'

        curl -X PATCH -H "Authorization Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" -d '{"state":"open"}'

        break
    fi
done
