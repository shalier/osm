#!/bin/bash
# shellcheck disable=SC1091

prNumber=$1

while true; do
    mergeable=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/shalier/osm/pulls/"$prNumber" | grep -w mergeable | awk '{print $2}' | sed -e 's/,//g')
    if [ "$mergeable" != "null" ]; then
        merged=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/shalier/osm/pulls/"$prNumber" | grep -w merged | awk '{print $2}' | sed -e 's/,//g')
        if [ "$merged" == false ]; then exit 1; fi
    fi
done
