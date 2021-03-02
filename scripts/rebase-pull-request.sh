#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
PR_NUM=$2
PR=$3
MAIN=$4

while true; do
    merged=$(curl -s -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w merged | awk '{print $2}' | sed -e 's/,//g')
    echo merged "$merged"
    if [ "$merged" == false ]; then
        while [ -z "$rebaseable" ] || [ "$rebaseable" == "null" ]; do
            rebaseable=$(curl -s -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w rebaseable | awk '{print $2}' | sed -e 's/,//g')
            echo rebaseable "$rebaseable"
            if [ "$rebaseable" == "true" ]; then
                git checkout "$PR"
                git checkout -b "${PR}_tmp"
                git rebase "$MAIN"
                git checkout "$MAIN"
                git pull . "${PR}_tmp"
                git branch -d "${PR}_tmp"
            fi
            echo "waiting 30s before checking if rebaseable"
            sleep 30
        done
    elif [ "$merged" == true ]; then
        echo PR "$PR_NUM" has been merged
        break
    fi
    echo "waiting 30s before checking if merged"
    sleep 30
done
